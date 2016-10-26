# Swift-Kuery
SQL database abstraction layer

## Examples:
##### SELECT * FROM t1;
```swift
let t1 = T1()
let s = Select(from: t1)
s.execute(connection) { queryResult in
  // ...
}
```

* SELECT a FROM t1;
```swift
let s = Select(t1.a, from: t1)
```
