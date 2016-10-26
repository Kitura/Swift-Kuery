# Swift-Kuery
SQL database abstraction layer

## Examples:
#### Classes used in the Examples
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
  ...
}
```

##### SELECT a FROM t1;
```swift
...
let s = Select(t1.a, from: t1)
connection.execute(query: s) { queryResult in
  ...
}
```
