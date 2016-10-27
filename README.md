# Swift-Kuery
SQL database abstraction layer

## Examples:
#### Classes used in the examples:
```swift
class T1 {
  var name = "t1"
  var a = Column("a")
  var b = Column("b")
}

class T2 {
  var name = "t2"
  var c = Column("c")
  var b = Column("b")
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
  .where((t1.a.like("b%") || (t1.a == "apple")) && t1.b > 5)
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
  .order(by: .DESC(t1.a))
  .having(sum(t1.b) > 3)
...
```

<br>
__INSERT INTO t1             
VALUES ('apple', 10), ('apricot', 3), ('banana', 17);__
```swift
...
let i = Insert(into: t1, rows: [["apple", 10], ["apricot", 3], ["banana", 17]])

connection.execute(query: i1) { queryResult in
  if queryResult.success  {
    ...
  }
  else if let queryError = result.asError {
    ...
  }
}
```

<br>
__UPDATE t1 SET a = 'peach', b = 2            
WHERE a = 'banana';__
```swift
...
let u = Update(table: t1, set: [(t1.a, "peach"), (t1.b, 2)])
  .where(t1.a == "banana")
...
```

<br>
__SELECT * FROM table1 AS t1            
LEFT JOIN table2 AS t2           
ON t1.b = t2.b;__
```swift
let table1 = T1()
let table2 = T2()

let t1 = table1.as("t1")
let t2 = table2.as("t2")
let s2 = Select(from: t1)
  .leftJoin(t2)
  .on(t1.b == t2.b)
...
```

<br>
__SELECT * FROM table1           
JOIN table2           
USING (b);__
```swift
let table1 = T1()
let table2 = T2()

let s2 = Select(from: table1)
  .join(table2)
  .using(table1.b)
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

connection.execute(query: i1, parameters: (["number" : 28, "fruit" : "banana"]) { queryResult in
  ...
}
```
