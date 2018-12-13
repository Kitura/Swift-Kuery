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

A connection from the pool will automatically be returned to the pool when it is no longer required. An exception to this is when a query has been executed that returns a result set, se the section below on retrieving results for more details.

## Preparing Statements

TODO - Discuss changes arounf preparing statements, to include QueryResult helper method. Provide example of previous usage and new usage.

## Protocol changes for QueryBuilder

TODO - Discuss QueryBuilder protocol changes. Provide examples of new requirements.

## Fetching results asynchronously / Releasing connections to the pool.

TODO - Discuss changes in ResultSet and new requirement to call done() once finished with result sets. Discuss result fetcher changes. Add examples.



