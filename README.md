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
```

##### SELECT * FROM t1;
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

##### SELECT a, b FROM t1
##### WHERE (a LIKE '%b' OR a = 'apple') AND b > 5
##### ORDER BY b ASC, a DESC;
```swift
...
let s = Select(t1.a, t1.b, from: t1)
  .where((t.a.like("b%") || (t.a == "apple")) && t.b > 5)
  .order(by: .ASC(t.b), .DESC(t.a))

connection.execute(query: s) { queryResult in
  ...
}
```

##### SELECT UCASE(a) AS name FROM t1
##### WHERE b >= 0
##### GROUP BY a
##### HAVING SUM(b) > 3
##### ORDER BY a DESC;
```swift
...
let s = Select(ucase(t.a).as("name"), from: t)
  .where(t.b >= 0)
  .group(by: t.a)
  .order(by: .DESC(t.a))
  .having(sum(t.b) > 3)
...
```
