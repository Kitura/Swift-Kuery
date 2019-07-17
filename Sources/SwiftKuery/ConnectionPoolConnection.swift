/**
 Copyright IBM Corporation 2017, 2018
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Dispatch

// MARK: ConnectionPoolConnection

/**
 Note: This class is usually initialised by the `ConnectionPool` instance. Therefore, a standard user will not use this class unless they are creating their own SQL plugin.
 
 This class uses a `Connection` instance and a `ConnectionPool` instance to implement a wrapper for the `Connection` class.
 It implements the functions of the `Connection` protocol, in addition to the `closeConnection()` function
 for releasing a `Connection` instance from the `ConnectionPool`.
 ### Usage Example: ###
 In this example, a `ConnectionPool` instance is initialized (parameters defined in docs for `ConnectionPool`).
 A `ConnectionPoolConnection` instance is created by calling `connectionPool.getConnection()`. This connection is then released from the pool.
 ```swift
 let connectionPool = ConnectionPool(options: options, connectionGenerator: connectionGenerator, connectionReleaser: connectionReleaser)
 let connection = connectionPool.getConnection()
 connection.closeConnection()
 ```
 */
public class ConnectionPoolConnection: Connection {

    private var connection: Connection?
    private weak var pool: ConnectionPool?
 
    // MARK: QueryBuilder
    /// The `QueryBuilder` with connection specific substitutions.
    public var queryBuilder: QueryBuilder {
        return connection?.queryBuilder ?? QueryBuilder(columnBuilder: DummyColumBuilder())
    }

    init(connection: Connection, pool: ConnectionPool) {
        self.connection = connection
        self.pool = pool
    }
    
    deinit {
        if let connection = connection {
            pool?.release(connection: connection)
        }
    }

    // MARK: Connections
    /// Establish a connection with the database.
    ///
    /// - Parameter onCompletion: The function to be called when the connection is established.
    public func connect(onCompletion: @escaping (QueryResult) -> ()) {
        if self.connection != nil {
            return runCompletionHandler(.successNoData, onCompletion: onCompletion)
        }
        self.pool?.getConnection() { poolConnection, error in
            guard let connection = poolConnection else {
                guard let error = error else {
                    return self.runCompletionHandler(.error(QueryError.connection("Failed to get connection")), onCompletion: onCompletion)
                }
                return self.runCompletionHandler(.error(error), onCompletion: onCompletion)
            }
            self.connection = connection
            return self.runCompletionHandler(.successNoData, onCompletion: onCompletion)
        }
    }
    
    /// Establish a connection with the database.
    ///
    /// - Returns: A QueryError if the connection cannot connect, otherwise nil
    public func connectSync() -> QueryResult {
        var result: QueryResult? = nil
        let semaphore = DispatchSemaphore(value: 0)
        connect() { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.connection("ConnectSync unexpetedly return a nil QueryResult"))
        }
        return resultUnwrapped
    }

    /**
     Close the connection to the database.
     ### Usage Example: ###
     In this example, the `closeConnection()` function is called on a `ConnectionPoolConnection` instance to release it from its ConnectionPool instance.
     ```swift
     connection.closeConnection()
     ```
     */
    public func closeConnection() {
        if let connection = connection {
            pool?.release(connection: connection)
            self.connection = nil
        }
    }
    
    /**
     An indication whether there is a connection to the database.
     ### Usage Example: ###
     In this example, the `isConnected()` function is called on a `ConnectionPoolConnection` instance called connection, this returns a true value that is then printed.
     ```swift
     let connected = connection.isConnected()
     print(connected)
     // Prints true
     ```
    
     - Returns: A boolean value, for whether the connection is connected.
    */
    public var isConnected: Bool {
        return connection?.isConnected ?? false
    }
    
    // MARK: Execute Querys
    /// Execute a query.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(query: Query, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(query: query) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a raw query.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(raw) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(query: Query, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(query: query, parameters: parameters) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a raw query with parameters.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(raw, parameters: parameters) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(query: Query, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(query: query, parameters: parameters) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a raw query with parameters.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(raw, parameters: parameters) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    // MARK: Prepared statements

    /// Create a prepared statement from the passed in query.
    ///
    /// - Parameter query: The query to prepare the statement for.
    /// - Parameter onCompletion: The function to be called when the preparation has completed.
    public func prepareStatement(_ query: Query, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.prepareStatement(query) { result in
            guard let _ = result.asPreparedStatement else {
                guard let error = result.asError else {
                    return self.runCompletionHandler(.error(QueryError.databaseError("Unable to generate prepared statement")), onCompletion: onCompletion)
                }
                let errorMessage = error.localizedDescription
                return self.runCompletionHandler(.error(QueryError.databaseError("Unable to generate prepared statement: \(errorMessage)")), onCompletion: onCompletion)
            }
            self.runCompletionHandler(result, onCompletion: onCompletion)
        }
    }

    /// Create a prepared statement from the passed in query.
    ///
    /// - Parameter raw: A String containing the query to prepare the statement for.
    /// - Parameter onCompletion: The function to be called when the preparation has completed.
    public func prepareStatement(_ raw: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.prepareStatement(raw) { result in
            guard let _ = result.asPreparedStatement else {
                guard let error = result.asError else {
                    return self.runCompletionHandler(.error(QueryError.databaseError("Unable to generate prepared statement")), onCompletion: onCompletion)
                }
                let errorMessage = error.localizedDescription
                return self.runCompletionHandler(.error(QueryError.databaseError("Unable to generate prepared statement: \(errorMessage)")), onCompletion: onCompletion)
            }
            self.runCompletionHandler(result, onCompletion: onCompletion)
        }
    }

    /// Execute a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func execute(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(preparedStatement: preparedStatement) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func execute(preparedStatement: PreparedStatement, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(preparedStatement: preparedStatement, parameters: parameters) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func execute(preparedStatement: PreparedStatement, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.execute(preparedStatement: preparedStatement, parameters: parameters) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Release a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to release.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func release(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.release(preparedStatement: preparedStatement) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Return a String representation of the query.
    ///
    /// - Parameter query: The query.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if the query build fails.
    public func descriptionOf(query: Query) throws -> String {
        if let connection = connection {
            return try connection.descriptionOf(query: query)
        }
        else {
            throw QueryError.connection("No connection to the database")
        }
    }

    // MARK: Transactions

    /// Start a transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of the start transaction command has completed.
    public func startTransaction(onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.startTransaction() { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Commit the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of the commit transaction command has completed.
    public func commit(onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.commit() { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Rollback the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of the rollback transaction command has completed.
    public func rollback(onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.rollback() { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Create a savepoint.
    ///
    /// - Parameter savepoint: The name to  be given to the created savepoint.
    /// - Parameter onCompletion: The function to be called when the execution of the create savepoint command has completed.
    public func create(savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.create(savepoint: savepoint) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Rollback the current transaction to the specified savepoint.
    ///
    /// - Parameter to savepoint: The name of the savepoint to rollback to.
    /// - Parameter onCompletion: The function to be called when the execution of the rollback transaction command has completed.
    public func rollback(to savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.rollback(to: savepoint) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    /// Release a savepoint.
    ///
    /// - Parameter savepoint: The name of the savepoint to release.
    /// - Parameter onCompletion: The function to be called when the execution of the release savepoint command has completed.
    public func release(savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.release(savepoint: savepoint) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }

    public func addLastUpdatedTrigger(for table: Table, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            return runCompletionHandler(.error(QueryError.connection("Connection is disconnected")), onCompletion: onCompletion)
        }
        connection.addLastUpdatedTrigger(for: table) { result in
            self.runCompletionHandlerRetainingConnection(result: result, onCompletion: onCompletion)
        }
    }
}

public class DummyColumBuilder : ColumnCreator {
    public func buildColumn(for column: Column, using queryBuilder: QueryBuilder) -> String? {
        return nil
    }
}
