# Swift-Kuery
SQL database abstraction layer

[![Build Status - Master](https://travis-ci.org/IBM-Swift/Kitura.svg?branch=master)](https://travis-ci.org/IBM-Swift/Swift-Kuery)
![Mac OS X](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)

## Summary
Swift-Kuery is a pluggable SQL database driver/SDK abstraction layer. Its main idea is to unify the APIs to the various relational databases, providing a Swifty yet SQL-like API.

While Swift-Kuery is not an Object-Relational Mapping (ORM), it provides a great basis to build an ORM. It is also useful if you don't want to commit to a specific database, allowing easy switch between databases.

Swift-Kuery is easy to learn, consumable framework that comes with a set of [implemented plugins](#list-of-plugins).

## Table of Contents
* [Example](#example)
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
class Grades : Table {
    let tableName = "Grades"
    let id = Column("id")
    let course = Column("course")
    let grade = Column("grade")
}
let grades = Grades()
```

Next we create a pool of connections to PostgreSQL:

```swift
let pool = PostgreSQLConnection.createPool(host: "localhost", port: 5432, options: [.userName("username"), .password("password")], poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50, timeout: 10000)))
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

connection.execute(query: query) { result: QueryResult in
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

## Query Examples
Lets see more examples of how to build and execute SQL queries using Swift-Kuery.

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
  else if let queryError = result.asError {
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

* [SQLite](https://github.com/IBM-Swift/Swift-Kuery-SQLite)

## License
This library is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE.txt).
