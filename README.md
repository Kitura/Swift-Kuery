# Swift-Kuery
SQL database abstraction layer

[![Build Status - Master](https://travis-ci.org/IBM-Swift/Kitura.svg?branch=master)](https://travis-ci.org/IBM-Swift/Swift-Kuery)
![Mac OS X](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)

## Summary
Swift-Kuery is a pluggable SQL database driver/SDK abstraction layer. Its main idea is to unify the APIs to the various relational databases, providing Swifty yet SQL-like API.

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
    let name = "Grades"
    let id = Column("id")
    let course = Column("course")
    let grade = Column("grade")
}
let grades = Grades()
```

Next we create a connection to PostgreSQL and connect to it. Note that the API is asynchronous:
```swift
let connection = PostgreSQLConnection(host: "localhost", port: 5432, options: [.userName("username"), .password("password")])
connection.connect() { error: QueryError in
  if let error = error {
    print(error)
  }
  else {
    // Build and execute your query here.
  }
```
Now lets build the query. Suppose we want to retrieve the average grades for courses with average greater than 90, and sort the results by the average ascending. Here is the SQL query we need to build:
```SQL
SELECT course, ROUND(AVG(grade), 1) AS "average grade" FROM grades
GROUP BY course
HAVING AVG(grade) > 90
ORDER BY AVG(grade) ASC
```
Note, that we also round the average grades and alias this column in the result as "average".

Here is how to create such query using Swift-Kuery:
```swift
let query = Select(grades.course, round(avg(grades.grade), 1).as("average"), from: grades)
            .group(by: grades.course)
            .having(avg(grades.grade) > 90)
            .order(by: .ASC(avg(grades.grade)))
```
As you can see, it is very similar to the SQL query syntax.

Now we execute the created query on our PostgreSQL connection:
```swift
connection.execute(query: query) { result: QueryResult in
  if let (titles, rows) = result.asRows {
      for title in titles {
          // The column names of the result.
      }
      for row in rows {
          for value in row {
            // ...
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
  let name = "t1"
  let a = Column("a")
  let b = Column("b")
}

class T2 {
  let name = "t2"
  let c = Column("c")
  let b = Column("b")
}
```
<br>
__SELECT * FROM t1;__
```swift
let t1 = T1()

let s = Select(from: t1)

s.execute(connection) { queryResult in
  if let (titles, rows) = result.asRows {
    for title in titles {
      ...
    }
    for row in rows {
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

<br>                                                      
__SELECT a, b FROM t1      
   WHERE (a LIKE '%b' OR a = 'apple') AND b > 5  
   ORDER BY b ASC, a DESC;__

```swift
...
let s = Select(t1.a, t1.b, from: t1)
  .where((t1.a.like("b%") || t1.a == "apple") && t1.b > 5)
  .order(by: .ASC(t1.b), .DESC(t1.a))

connection.execute(query: s) { queryResult in
   ...
}
```

<br>
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

<br>
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

<br>
__INSERT INTO t1             
VALUES ('apple', 10);__
```swift
...
let i = Insert(into: t1, values: "apple", 10)
...
```


<br>
__INSERT INTO t1 (a, b)              
VALUES ('apricot', '3');__
```swift
...
let i = Insert(into: t1, valueTuples: (t1.a, "apricot"), (t1.b, "3"))
...
```

<br>
__INSERT INTO t1 (a, b)              
VALUES ('apricot', '3');__
```swift
...
let i = Insert(into: t1, columns: [t1.a, t1.b], values: ["apricot", 3])
...
```
<br>
__UPDATE t1 SET a = 'peach', b = 2            
WHERE a = 'banana';__
```swift
...
let u = Update(t1, set: [(t1.a, "peach"), (t1.b, 2)])
  .where(t1.a == "banana")
...
```

<br>
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

<br>
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

<br>
__INSERT INTO t1             
VALUES (@0,@1);__
```swift
let i = Insert(into: t1, values: Parameter(), Parameter())

connection.execute(query: i1, parameters: "banana", 28) { queryResult in
  ...
}
```

<br>
__INSERT INTO t1             
VALUES (@fruit,@number);__
```swift
let i = Insert(into: t1, values: Parameter("fruit"), Parameter("number"))

connection.execute(query: i1, parameters: ["number" : 28, "fruit" : "banana"]) { queryResult in
  ...
}
```
<br>
__Raw query:__
```swift
connection.execute("CREATE TABLE myTable (a varchar(40), b integer)") {  queryResult in
  ...
}
```
<br>
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
## List of plugins:

* [PostgreSQL](https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL)

* [SQLite](https://github.com/IBM-Swift/Swift-Kuery-SQLite)

## License
This library is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE.txt).
