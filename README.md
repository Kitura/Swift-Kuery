# Swift-Kuery
SQL database abstraction layer

## Examples:
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
