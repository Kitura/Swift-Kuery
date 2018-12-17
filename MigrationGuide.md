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

This migration guide will highlight the changes in Swift Kuery 3.0 that will affect existing code and is intended to help consumers during their adoption of this release.

Each change in the API is broken down and examples are provided for it's usage before and after.

## Using the asynchronous API

While the Swift Kuery API has always been asynchronous in style the underlying implementation was synchronous. With this release the underlying implementation will behave in an asynchronous manner. This change will cause any application using the API in a non-asynchronous fashion to behave in an unpredictable manner.

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

Because the execute API now behaves asynchronously the code will immediately return from the first call to connection.execute resulting in two concurrent operations on the same connection, those being executing query and executing newQuery.

To do this properly you would need to nest the calls as in the example below:

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

In this case the second connection.execute call is run after the first call has completed by virtue of it being part of the callback from the first call.

This principal applies equally to all the asynchronous API’s in Swift Kuery and is important for the project as it will allow easier adoption of an alternative database driver in future, for example one which uses the asynchronous c api’s or perhaps a pure swift driver.

## Getting a database connection

The connection protocol’s connect method has been updated to accept a callback which will be called in an asynchronous fashion, previously the call would have behaved synchronously. The updated method will pass a QueryResult to the callback that will indicate whether the connection was successfully made or not.

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

With the new method your code will need to be updated to handle the change in return type in a manner similar to that in the example below:

```swift
let connection = PostgreSQLConnection(….)
// Connect the connection
connection.connect { queryResult in
    guard let _ = queryResult.success else {
        // Connection not established, call queryResult.asError to get error.
        return
    }
     // Connection established
     connection.execute(….) { result in
         // Handle result
    }
}
```

The connection protocol has also been updated to include a connectSync method. As suggested by it’s name this function is synchronous in nature, An example of its usage is below:

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

It is recommended that the connectSync method is used only during application initialisation due to it’s blocking nature.

## Using a connection pool

The Swift Kuery ConnectionPool has also seen some rework in this release with the previously synchronous getConnection function now updated to accept a connectionPoolTask that will be executed once a connection is available. This change removes the ability to timeout while waiting for a database connection.

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

With the new release you will define a connectionPoolTask that is passed to the getConnection call. If a connection is available in the pool the task will execute immediately, if a connection is not available from the pool the task is added to a queue to be processed when a connection becomes available. When a connection taken from the pool is eligible to return to the pool it will first be used to execute any outstanding tasks on the backlog. Once the backlog is empty the connection will be returned to the pool. An example of using the updated API is below along with the signature of a connectionPoolTask:

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

A connection from the pool will automatically be returned to the pool when it is no longer required. An exception to this is when a query has been executed that returns a result set, see the section below on retrieving results for more details.

## Preparing Statements

The Connection protocols prepareStatement function has also seen a signature update to make it asynchronous in style and behaviour, the function will also now return a QueryResult on which you can call a new helper function, asPreparedStatement, to retrieve the prepared statement.

Previous usage of the API would have looked similar to the example below:

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

With the changes usage of the API is aligned with the other functions on the Connection protocol and will look similar to:

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

```swift
TODO - Discuss changes in ResultSet and new requirement to call done() once finished with result sets. Discuss result fetcher changes. Add examples.

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

TODO - Discuss QueryBuilder protocol changes. Provide examples of new requirements.

