# Swift-Kuery
SQL database abstraction layer

[![Build Status - Master](https://travis-ci.org/IBM-Swift/Swift-Kuery.svg?branch=master)](https://travis-ci.org/IBM-Swift/Swift-Kuery)
![Mac OS X](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)

## Summary
Swift-Kuery is a pluggable SQL database driver/SDK abstraction layer. Its main idea is to unify the APIs to the various relational databases, providing a Swifty yet SQL-like API.

While Swift-Kuery is not an Object-Relational Mapping (ORM), it provides a great basis to build an ORM. It is also useful if you don't want to commit to a specific database, allowing easy switch between databases.

Swift-Kuery is easy to learn, consumable framework that comes with a set of [implemented plugins](#list-of-plugins).

## Table of Contents
* [Example](#example)
* [SQL Injection Prevention using Parameterization](#sql-injection-prevention-using-parameterization)
* [Prepared Statements](#prepared-statements)
* [Schema Management](#schema-management)
* [Query Examples](#query-examples)
* [List of plugins](#list-of-plugins)
* [License](#license)

## Example
This example demonstrates how to execute an SQL query using Swift-Kuery and Swift-Kuery-PostgreSQL. It assumes there is a PostgreSQL server running on localhost:5432, that contains a table called Grades:

```
 id   |  course   | grade
------+-----------+-------
12345 | physics   |    82
12345 | chemistry |    90
12345 | history   |    98
78901 | history   |   100
78901 | chemistry |    94
78901 | physics   |    90
24680 | physics   |    74
24680 | chemistry |    92
24680 | history   |    90

```

First we import Swift-Kuery and Swift-Kuery-PostgreSQL:

```swift
import SwiftKuery
import SwiftKueryPostgreSQL
```

Now we create a `Table` that corresponds to our Grades table in PostgreSQL - we set the table's name and its columns:

```swift
class Grades: Table {
    let tableName = "Grades"
    let id = Column("id")
    let course = Column("course")
    let grade = Column("grade")
}
let grades = Grades()
```

Next we create a pool of connections to PostgreSQL:

```swift
let pool = PostgreSQLConnection.createPool(host: "localhost", port: 5432, options: [.userName("username"), .password("password")], poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50, timeout: 10000))
```

Every time we need a connection, we get it from the pool:

```swift
if let connection = pool.getConnection() {
   // Build and execute your query here.
}
else {
   print("Error: failed to get a connection.")
}
```

Now lets build the query. Suppose we want to retrieve the average grades for courses with average greater than 90, and sort the results by the average ascending. Here is the SQL query we need to build:

```SQL
SELECT course, ROUND(AVG(grade), 1) AS "average" FROM grades
GROUP BY course
HAVING AVG(grade) > 90
ORDER BY AVG(grade) ASC
```
Note, that we also round the average grades and alias this column in the result as "average".

Here is how to create such query using Swift-Kuery:

```swift
let query = Select(grades.course, round(avg(grades.grade), to: 1).as("average"), from: grades)
            .group(by: grades.course)
            .having(avg(grades.grade) > 90)
            .order(by: .ASC(avg(grades.grade)))
```
As you can see, it is very similar to the SQL query syntax.

Now we execute the created query on our PostgreSQL connection:

```swift
guard let connection = pool.getConnection() else {
   // Error
}

connection.execute(query: query) { queryResult in
  if let resultSet = queryResult.asResultSet {
    for title in resultSet.titles {
      // The column names of the result.
    }
    for row in resultSet.rows {
      for value in row {
        ...
      }
    }
  }
  else if let queryError = result.asError {
      // Something went wrong.
  }
}
```
The expected result is:

```
course     average
chemistry  92.0
history    96.0
```

## SQL Injection Prevention using Parameterization

Parameterize queries to prevent SQL Injection attacks by using Parameter() for untrusted input.

For example, this is vulnerable to SQL Injection attacks if `supplied_key1` or `supplied_key2` is untrusted input:
```swift
let query = Select(from: confidential)
  .where(confidential.key1 == supplied_key1 || confidential.key2 == supplied_key2)

connection.execute(query: query) { queryResult in
  ...
}
```

To guard against SQL Injection attacks, use the following Parameterized version instead:
```swift
let query = Select(from: confidential)
  .where(confidential.key1 == Parameter() || confidential.key2 == Parameter())

connection.execute(query: query, parameters: supplied_key1, supplied_key2) { queryResult in
  ...
}
```

## Prepared Statements

If your application executes some query multiple times with different parameters, you may want to improve the performance of the application by using a prepared statement for that query. I.e. send the query to the database in advance, and later use the returned handle to execute the query providing the parameters. This way the database server will process the query only once.

For example, suppose our application needs to retrieve the average grade for courses with an average above various values. We change our query to use a parameter instead of a preset value of 90: 

```swift
let query = Select(grades.course, round(avg(grades.grade), to: 1).as("average"), from: grades)
            .group(by: grades.course)
            .having(avg(grades.grade) > Parameter())
            .order(by: .ASC(avg(grades.grade)))
```

Now we prepare the statement:

```swift
do {
   let preparedStatement = try connection.prepareStatement(query)
}
catch {
   // Error.
}
```

**Note**: `preparedStatement` is a plugin-specific handle for the prepared statement.

Now we can use this handle to execute the query with different parameters without creating it every time:

```swift
connection.execute(preparedStatement: preparedStatement, parameters: [70]) { result in
   ...
}
```

Use the `release` function to free the prepared statement:
```swift
connection.release(preparedStatement: preparedStatement) { result in 
  ...
}
```

## Schema Management

### Table creation
Swift-Kuery enables you to create tables on the database server.

Let's rewrite our `Grades` table by adding columns type and constraints: 

```swift
class Grades: Table {
    let tableName = "Grades"
    let id = Column("id", Char.self, length: 6, primaryKey: true)
    let course = Column("course", Varchar.self, length: 50)
    let grade = Column("grade", Int16.self, check: "grade >= 0")
}
```

We can add a foreign key to `Grades` that references a column in another table:

```swift
let grades = Grades().foreignKey(grades.course, references: courses.name)
```

And create a multi-column primary key (if not set in the column as for `Grades.id`):

```swift
grades.primaryKey(grades.id, grades.course)
```

To create the table in the database, do:

```swift

grades.create(connection: connection) { result in
     guard result.success else {
        print("Failed to create table: \(result.asError?)")
     }
    ...
}
```

### Indices

You can manage indices with Swift-Kuery in the following way:

```swift
let index = Index("index", on: grades, columns: [grades.id, desc(grades.grade)])
index.create(connection: connection) { result in ... }
...
index.drop(connection: connection) { result in ... }
```

### Migration
Swift-Kuery has a class `Migration` to help with migrations between two versions of a table.

Suppose we have a table `MyTable` in our application. The suggested usage is to keep versions of the table classes somewhere in the application code:

```swift
public class MyTable_v0: Table {
    let a = Column("a", ...)
    let b = Column("b", ...)
    let tableName = "MyTable"
}

public class MyTable_v1: Table {
    let b = Column("b", ...)
    let c = Column("c", ...)
    let tableName = "MyTable"
}
```

And use a typealias to refer to the current version of the table class in the application:

```swift
typealias MyTable = MyTable_v0
let t = MyTable()
let q = Select(from t)
...
```

The migration code from v0 to v1 should be something like this:

```swift
let t0 = MyTable_v0()
let t1 = MyTable_v1()
let migration0 = Migration(from: t0, to: t1, using: connection)
migration0.alterTableAdd(column: t1.c) { result in ... }
```

And raw alternations, if needed:

```swift
let dropColumnQuery = "ALTER TABLE " + t1.tableName + " DROP COLUMN " + t0.a.name
connection.execute(dropColumnQuery) { result in ... }
```

## Query Examples
Let's see more examples of how to build and execute SQL queries using Swift-Kuery.

#### Classes used in the examples:

```swift
class T1 {
  let tableName = "t1"
  let a = Column("a")
  let b = Column("b")
}

class T2 {
  let tableName = "t2"
  let c = Column("c")
  let b = Column("b")
}
```

&nbsp;

__SELECT * FROM t1;__

```swift
let t1 = T1()

let s = Select(from: t1)

guard let connection = pool.getConnection() else {
   // Error
}

s.execute(connection) { queryResult in
  if let resultSet = queryResult.asResultSet {
    for title in resultSet.titles {
      ...
    }
    for row in resultSet.rows {
      for value in row {
        ...
      }
    }
  }
  else if let queryError = queryResult.asError {
    ...
  }
}
```

&nbsp;

__SELECT a, b FROM t1      
   WHERE (a LIKE '%b' OR a = 'apple') AND b > 5  
   ORDER BY b ASC, a DESC       
   OFFSET 5;__

```swift
...
let s = Select(t1.a, t1.b, from: t1)
  .where((t1.a.like("b%") || t1.a == "apple") && t1.b > 5)
  .order(by: .ASC(t1.b), .DESC(t1.a))
  .offset(5)

connection.execute(query: s) { queryResult in
   ...
}
```

&nbsp;

__SELECT UCASE(a) AS name FROM t1    
 WHERE b >= 0         
 GROUP BY a         
 HAVING SUM(b) > 3        
 ORDER BY a DESC;__

```swift
...
let s = Select(ucase(t1.a).as("name"), from: t1)
  .where(t1.b >= 0)
  .group(by: t1.a)
  .having(sum(t1.b) > 3)
  .order(by: .DESC(t1.a))
...
```

&nbsp;

__INSERT INTO t1             
VALUES ('apple', 10), ('apricot', 3), ('banana', 17);__

```swift
...
let i = Insert(into: t1, rows: [["apple", 10], ["apricot", 3], ["banana", 17]])

connection.execute(query: i) { queryResult in
  if queryResult.success  {
    ...
  }
  else if let queryError = result.asError {
    ...
  }
}
```

&nbsp;

__INSERT INTO t1             
VALUES ('apple', 10);__

```swift
...
let i = Insert(into: t1, values: "apple", 10)
...
```

&nbsp;


__INSERT INTO t1 (a, b)              
VALUES ('apricot', '3');__

```swift
...
let i = Insert(into: t1, valueTuples: (t1.a, "apricot"), (t1.b, "3"))
...
```

&nbsp;

__INSERT INTO t1 (a, b)              
VALUES ('apricot', '3');__

```swift
...
let i = Insert(into: t1, columns: [t1.a, t1.b], values: ["apricot", 3])
...
```

&nbsp;

__UPDATE t1 SET a = 'peach', b = 2            
WHERE a = 'banana';__

```swift
...
let u = Update(t1, set: [(t1.a, "peach"), (t1.b, 2)])
  .where(t1.a == "banana")
...
```

&nbsp;

__SELECT * FROM t1 AS left            
LEFT JOIN t2 AS right           
ON left.b = right.b;__

```swift
let t1 = T1()
let t2 = T2()

let leftTable = t1.as("left")
let rightTable = t2.as("right")
let s2 = Select(from: leftTable)
  .leftJoin(rightTable)
  .on(leftTable.b == rightTable.b)
...
```

&nbsp;

__SELECT * FROM t1           
JOIN t2           
USING (b);__

```swift
...
let s2 = Select(from: t1)
  .join(t2)
  .using(t1.b)
...
```

&nbsp;

#### Queries with parameters:                         
**Note**: Named parameters are supported for all databases, even for those that do not support named parameters (e.g. PostgreSQL).


__INSERT INTO t1             
VALUES (@0,@1);__

```swift
let i = Insert(into: t1, values: Parameter(), Parameter())

connection.execute(query: i1, parameters: "banana", 28) { queryResult in
  ...
}
```

&nbsp;

__INSERT INTO t1             
VALUES (@fruit,@number);__

```swift
let i = Insert(into: t1, values: Parameter("fruit"), Parameter("number"))

connection.execute(query: i1, parameters: ["number" : 28, "fruit" : "banana"]) { queryResult in
  ...
}
```

&nbsp;

It is possible to insert NULL values using parameters:
&nbsp;

```swift
connection.execute(query: i1, parameters: ["number" : 28, "fruit" : nil]) { queryResult in
  ...
}
```

&nbsp;

__Raw query:__

```swift
connection.execute("CREATE TABLE myTable (a varchar(40), b integer)") {  queryResult in
  ...
}
```

&nbsp;

__SELECT LEFT(a, 2) as raw FROM t1     
 WHERE b >= 0
 GROUP BY a         
 HAVING sum(b) > 3               
 ORDER BY a DESC;__

```swift
...
let s = Select(RawField("LEFT(a, 2) as raw"), from: t1)
  .where("b >= 0")
  .group(by: t1.a)
  .having("sum(b) > 3")
  .order(by: .DESC(t1.a))
...
```

&nbsp;

__SELECT * FROM t1     
WHERE b >= ANY (SELECT b FROM t2);__

```swift
...
let s = Select(from: t1)
  .where(t1.b >= any(Select(t2.b, from: t2)))
...
```

&nbsp;

__SELECT * FROM t1     
WHERE NOT EXISTS (SELECT * FROM t2 WHERE b < 8);__

```swift
...
let s = Select(from: t1)
  .where(notExists(Select(from: t2).where(t2.b < 8)))
...
```

&nbsp;

__SELECT c FROM t2
GROUP BY c     
HAVING SUM(b) NOT IN (SELECT b FROM t1 WHERE a = 'apple');__

```swift
...
let s = Select(t2.c, from: t2)
    .group(by: t2.c)
    .having(sum(t2.b).notIn(Select(t1.b, from: t1).where(t1.a == "apple")))
...
```

## List of plugins:

* [PostgreSQL](https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL)

* [MySQL](https://github.com/IBM-Swift/SwiftKueryMySQL)

## License
This library is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE.txt).
