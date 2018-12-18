<p align="center">
    <a href="http://kitura.io/">
        <img src="https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Sources/Kitura/resources/kitura-bird.svg?sanitize=true" height="100" alt="Kitura">
    </a>
</p>


<p align="center">
    <a href="https://ibm-swift.github.io/Swift-Kuery/index.html">
    <img src="https://img.shields.io/badge/apidoc-SwiftKuery-1FBCE4.svg?style=flat" alt="APIDoc">
    </a>
    <a href="https://travis-ci.org/IBM-Swift/Swift-Kuery">
    <img src="https://travis-ci.org/IBM-Swift/Swift-Kuery.svg?branch=master" alt="Build Status - Master">
    </a>
    <img src="https://img.shields.io/badge/os-macOS-green.svg?style=flat" alt="macOS">
    <img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux">
    <img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
    <a href="http://swift-at-ibm-slack.mybluemix.net/">
    <img src="http://swift-at-ibm-slack.mybluemix.net/badge.svg" alt="Slack Status">
    </a>
</p>

# Migrating to Swift Kuery 3.0

This guide introduces the changes in version 3.0 that affect existing code, to assist consumers during the adoption of this release.

For each change to the API, an example of its usage before and after is provided.

## Using the asynchronous API

While the Swift Kuery API has always been asynchronous in style, the underlying implementation invoked the completion handlers synchronously. This allowed for implementations to make incorrect assumptions about the ordering of execution.

In the 3.0 release, completion handlers are invoked asynchronously, which has several benefits:
* Independent database operations can easily be run in parallel, by executing each operation on a separate connection. Because the calls no longer block, operations can be expressed sequentially but will execute in parallel.
* Operations that require a connection from a ConnectionPool can be safely nested without the risk of exhausting the pool and causing deadlock.
* Kuery can adopt more scalable, non-blocking database connectors in the future without affecting the behaviour of applications built on top of it.

However, applications that rely on the synchronous execution of completion handlers are likely to require changes, as these assumptions no longer hold.

Below is an example of usage that would have worked prior to these changes but is now likely to cause an application to error:

```swift
let query = Select(from: myTable)
connection.execute(query: query) { result in
    //Handle result
}
let newQuery = Select(from: otherTable)
connection.execute(query: newQuery) { result in
    //Handle result
}
```

As the completion handler for execute() is now invoked asynchronously, the code will immediately continue on to the second call to execute(), resulting in an attempt to perform two parallel operations on the same connection.

Dependent operations should instead be nested as per the example below:

```swift
let query = Select(from: myTable)
connection.execute(query: query) { result in
    //Handle result
    let newQuery = Select(from: otherTable)
    connection.execute(query: newQuery) { result in
        //Handle result
    }
}
```
The second connection.execute() is run only once the first has completed. By doing so, you can safely access the results of the first query before issuing subsequent operations that depend on them.

Alternatively, if the two queries are genuinely independent, you can improve the responsiveness of your application by executing them in parallel using two connections.

This principal applies equally to all the asynchronous API’s in Swift Kuery.

## Getting a database connection

The Connection protocol's connect() method now accepts a completion handler that will be invoked asychronously. Previously, the call would block while a connection was established. The completion handler receives a QueryResult that indicates whether the connection was successful.

Prior to this change your code for creating and using a connection would have looked similar to the example below:

```swift
let connection = PostgreSQLConnection(….)
// Connect the connection
connection.connect { error in
    if let error = error {
        // Connection not established - handle and return
     }
     // Connection established
     connection.execute(….) { result in
         // Handle result
    }
}
```

Below is an example of the 3.0 API, using the QueryResult to check for an error:

```swift
let connection = PostgreSQLConnection(….)
// Connect the connection
connection.connect { queryResult in
    guard let _ = queryResult.success else {
        if let error = queryResult.asError {
            return Log.error("Connection failed: \(error)")`
        }
        // Unknown error
        return
    }
     // Connection established
     connection.execute(….) { result in
         // Handle result
    }
}
```

The connection protocol has also been updated to include a `connectSync` method. As suggested by it’s name this function is synchronous in nature, An example of its usage is below:

```swift
let connection = PostgreSQLConnection(….)
// Connect the connection
let queryResult = connection.connectSync()
guard let _ = queryResult.success else {
    // Connection not established, call queryResult.asError to get error.
    return
}
// Connection established
connection.execute(….) { result in
    // Handle result
}
```

It is recommended that the `connectSync` method is used only during application initialisation due to it’s blocking nature.

## Using a connection pool

The Swift Kuery ConnectionPool has also seen some rework in this release with the previously synchronous `getConnection` function now updated to accept a `connectionPoolTask` that will be executed once a connection is available. This change removes the ability to timeout while waiting for a database connection.

Prior to these changes you code would look similar to:

```swift
let pool = PostgreSQLConnectionPool(….)
// Get connection from pool
let connection = pool.getConnection()
guard let connection = connection else {
    // Unable to get connection from pool
    return
}
connection.execute(….) { result in
    // Handle result
}
// Optionally release the connection
pool.release(connection: connection)
```

For Swift Kuery 3.0 you will define a connectionPoolTask that is passed to the `getConnection` call. If a connection is available in the pool the task will execute immediately, if a connection is not available from the pool the task is added to a queue to be processed when a connection becomes available. When a connection taken from the pool is eligible to return to the pool it will first be used to execute any outstanding tasks on the backlog. Once the backlog is empty the connection will be returned to the pool. Below is an example of the 3.0 API, along with the signature of a connectionPoolTask:

```swift
// connectionPoolTask is a typealias for a closure with the following signature
public typealias connectionPoolTask = ((ConnectionPoolConnection?, QueryError?) -> ())

// Usage of the API should now look similar to…
let pool = PostgreSQLConnectionPool(….)
// Get connection passing task to execute
Pool.getConnection() { connection, error in
    guard let connection = connection else {
        // Handle error case
        Return
    }
    Connection.execute() { result in
        // Handle result
        // Optionally release connection
        pool.release(connection: connection)
    }
}
```

A connection will automatically be returned to the pool when it is no longer required. An exception to this is when a query has been executed that returns a result set, see the section below on retrieving results for more details.

## Preparing Statements

The Connection protocols `prepareStatement` function has been updated to accept a completion handler that will be invoked asynchronously. The completion handler receives a `QueryResult` on which you can call a new helper function, `asPreparedStatement`, to retrieve the prepared statement.

Usage of the 2.0 API would have looked similar to the example below:

```swift
let connection = PostgreSQLConnection(….)
// Connect the connection
connection.connect { error in
    if let error = error {
        // Connection not established - handle and return
     }
    // Create a prepared statement
    let select = SELECT(from: myTable)
    do {
        try let statement = connection.prepareStatement(select)
        connection.execute(statement: statement) { result in
            // Handle result
        }
    } catch {
        // Handle thrown error
    }
}
```

With the changes usage of the API is aligned with the other functions on the Connection protocol, an example of using the 3.0 API is below:

```swift
let connection = PostgreSQLConnection(….)
// Connect the connection
connection.connect { error in
    if let error = error {
        // Connection not established - handle and return
     }
    // Create a prepared statement
    let select = SELECT(from: myTable)
    connection.prepareStatement(select) { result in
        guard let statement = result.asPreparedStatement else {
            // Handle error
            Return
        }
        // Execute the statement
        connection.execute(statement: statement) { result in
            // Handle result
        }
    }
}
```

## Fetching results asynchronously / Releasing connections to the pool.
This release also gives the Swift Kuery result API an overhaul, the API is now asynchronous in style and behaviour bringing it in line with the rest of the Swift Kuery API.

### QueryResult changes
The asRows function on QueryResult has been updated to now accept a closure that will be called back with an optional array of dictionaries and optional error, rather than simply returning the array of dictionaries as it would have done prior to the change. Another important point to note regarding this API is that it will consume the whole result set and close it before making the callback to the passed closure.

Previous usage of the API would have looked similar to the example below:

```swift
connection.execute(query: query) { result in
    let rows = result.asRows()
     // Process rows
}
```

Usage of the new API should look similar to the example below”

```swift
connection.execute(query: query) { result in
    result.asRows() { rows, error in
        guard let rows = rows else {
            // Handle error
            return
        }
        // Process rows
    }
}
```

### ResultSet changes
The biggest overhaul in the result API is of ResultSet. The nextRow method has seen a small update to its signature, new functions for retrieving column titles and closing the result set have been added and a new mechanism for iterating the rows is has replaced the previous sequence variable.

The first of these changes is the smallest and has been made to expose any errors encountered when retrieving results from the database to the caller. The updated signature now passes an optional array of results as before but also an optional error. Previous usage of the API would be similar to:

```swift
connection.execute(query: query) { result in
    guard let resultSet = result.asResultSet() {
        //Handle other case
        return
    }
    resultSet.nextRow() { row in
        guard let row = row else {
            // Unknown error
            return
        }
        // Process row
}
```

Following the update the API is used in the same manner, however we can now expose the error that was encountered when retrieving the row as follows:

```swift
connection.execute(query: query) { result in
    guard let resultSet = result.asResultSet() {
        //Handle other case
        return
    }
    resultSet.nextRow() { row, error in
        guard let row = row else {
            guard let error = error else {
                // No Further rows
                return
            }
            print("Error getting row: \(error)”)
            return
        }
        // Process row
}
```

Column titles are now retrieved via a function rather than the previous variable. This change aligns retrieving titles with the rest of the API and allows more flexibility with respect to future changes to underlying behaviour. Previously you could retrieve the titles using code similar to:

```swift
connection.execute(query: query) { result in
    guard let resultSet = result.asResultSet() {
        //Handle other case
        return
    }
    // Get the titles.
    let titles = resultSet.titles
}
```

Following the update your code to retrieve the column titles will look similar to:

```swift
connection.execute(query: query) { result in
    guard let resultSet = result.asResultSet() {
        //Handle other case
        return
    }
    // Get the titles.
    resultSet.getColumnTitles() { titles, error in
        guard let titles = titles else {
            // Handle error case
            return
        }
        // Use titles
    }
}
```

This release add’s the done function to the ResultSet API. The done function can be called to indicate that no further processing will be carried out on the result set and make resources associated with it available for re-use. Below is an example of using the new API.

```swift
connection.execute(query: query) { result in
    guard let resultSet = result.asResultSet() {
        //Handle other case
        return
    }
    resultSet.nextRow() { row, error in
        guard let row = row else {
            guard let error = error else {
                // No Further rows
                return
            }
            print("Error getting row: \(error)”)
            return
        }
        // Process row
        // No further processing needed so call done to release partially consumed result.
        resultSet.done()
}
```

The final change within ResultSet is the introduction of the forEach functions which replace the rows variable. The forEach functions allow you to run a specific operations against each row returned from your query. One function will autonomously iterate the rows in the result set, the other provides the user a next method to call when they are ready to process the next row which allows the caller to make use of other asynchronous API. Examples for using each of the variants are below including the definition of the RowOperation types:

```swift
// Type alias for closures to be passed to the forEach method
public typealias RowOperation = ([Any?]?, Error?) -> Void

// Type alias for closures to be passed to the forEach method which allows asynchronous operations.
public typealias RowOperationWithNext = ([Any?]?, Error?, () -> Void) -> Void

// Example usage for iterating all rows to count them
connection.execute(query: query) { result in
    guard let resultSet = result.asResultSet() {
        //Handle other case
        return
    }
    var rowCount = 0
    resultSet.forEach() { row, error in
        guard let row = row else {
            guard let error = error else {
                // No rows remaining
                return rowCount
            }
            // Handle error
            return
        }
        rowCount += 1
     }
}

// Example of performing asynchronous work on each row
connection.execute(query: query) { result in
    guard let resultSet = result.asResultSet() {
        //Handle other case
        return
    }
    resultSet.forEach() { row, error, next in
        guard let row = row else {
            guard let error = error else {
                // No rows remaining
                return
            }
            // Handle error
            return
        }
        anAsyncCall(row) { result in
            // Do stuff
            // Call next to invoke operation on next row in the result set.
            next()
     }
}
```

### ResultFetcher changes
The ResultFetcher protocol has also seen a small update in this release. If you implement a class conforming to ResultFetcher please note the updated signatures on the fetchNext and fetchTitles functions:

```swift
func fetchNext(callback: @escaping (([Any?]?, Error?)) ->())

func fetchTitles(callback: @escaping (([String]?, Error?)) -> ())
```
Accompanying these updates the protocol also now requires a done function. This function should close any underlying database connection and release associated
System resources:

```swift
// Closes any underlying database connections and releases system resources synchronously
func done()
```

## Protocol changes for QueryBuilder

One of the changes in SwiftKuery 3.0 is that the logic for building the description of Columns is being moved out of Kuery and into the database plugin. Each database plugin has different requirements regarding the syntax for specifying a column, while this logic was in SwiftKuery it had to be aware of each plugins requirements and the resulting code was complex.

To simplify the interface between SwiftKuery and the plugins we have updated the QueryBuilder protocol to include a requirement for a class conforming to a new protocol ColumnCreator. The ColumnCreator protocol requires a single function named buildColumn, this function accepts a SwiftKuery Column and instance of QueryBuilder and returns an optional String representing the description of the column that the implementing plugin will accept. SwiftKueryPostgreSQL, SwiftKueryMySQL and SwiftKuerySQLite all have implementations of the protocol you can use for reference.
