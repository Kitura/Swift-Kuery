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
    public func connect(onCompletion: @escaping (QueryError?) -> ()) {
        if self.connection != nil {
            return onCompletion(nil)
        }
        guard let connection = self.pool?.take() else {
           return onCompletion(.connection("Failed to get connection"))
        }
        self.connection = connection
        onCompletion(nil)
    }
    
    /// Establish a connection with the database.
    ///
    /// - Returns: A QueryError if the connection cannot connect, otherwise nil
    public func connectSync() -> QueryError? {
        var error: QueryError?
        let semaphore = DispatchSemaphore(value: 0)
        connect() { err in
            error = err
            semaphore.signal()
        }
        semaphore.wait()
        // error will be nil if the connection attempt was succesful
        return error
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
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(query: query) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a query.
    ///
    /// - Parameter query: The query to execute.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(query: Query) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(query: query) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Execute a raw query.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(raw) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a raw query.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(_ raw: String) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(raw) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(query: Query, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(query: query, parameters: parameters) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(query: Query, parameters: [Any?]) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(query: query, parameters: parameters) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Execute a raw query with parameters.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(raw, parameters: parameters) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a raw query with parameters.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(_ raw: String, parameters: [Any?]) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(raw, parameters: parameters) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(query: Query, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(query: query, parameters: parameters) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(query: Query, parameters: [String:Any?]) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(query: query, parameters: parameters) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Execute a raw query with parameters.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(raw, parameters: parameters) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a raw query with parameters.
    ///
    /// - Parameter raw: A string that contains the query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(_ raw: String, parameters: [String:Any?]) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(raw, parameters: parameters) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    // MARK: Prepared statements

    /// Create a prepared statement from the passed in query.
    ///
    /// - Parameter query: The query to prepare the statement for.
    /// - Returns: The prepared statement.
    /// - Throws: QueryError.syntaxError if the query build fails, or a database error if it fails to prepare statement.
    public func prepareStatement(_ query: Query) throws -> PreparedStatement {
        guard let connection = connection else {
            throw QueryError.connection("Connection is disconnected")
        }
        return try connection.prepareStatement(query)
    }

    /// Create a prepared statement from the passed in query.
    ///
    /// - Parameter raw: A String containing the query to prepare the statement for.
    /// - Returns: The prepared statement.
    /// - Throws: QueryError.syntaxError if query build fails, or a database error if it fails to prepare the statement.
    public func prepareStatement(_ raw: String) throws -> PreparedStatement {
        guard let connection = connection else {
            throw QueryError.connection("Connection is disconnected")
        }
        return try connection.prepareStatement(raw)
    }

    /// Execute a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func execute(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(preparedStatement: preparedStatement) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(preparedStatement: PreparedStatement) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(preparedStatement: preparedStatement) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func execute(preparedStatement: PreparedStatement, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(preparedStatement: preparedStatement, parameters: parameters) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(preparedStatement: PreparedStatement, parameters: [Any?]) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(preparedStatement: preparedStatement, parameters: parameters) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func execute(preparedStatement: PreparedStatement, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(preparedStatement: preparedStatement, parameters: parameters) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Returns: A QueryResult representing the result of the execute operation
    public func executeSync(preparedStatement: PreparedStatement, parameters: [String:Any?]) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        execute(preparedStatement: preparedStatement, parameters: parameters) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Release a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to release.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func release(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.release(preparedStatement: preparedStatement) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Release a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to release.
    /// - Returns: A QueryResult representing the result of the operation
    public func releaseSync(preparedStatement: PreparedStatement) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        release(preparedStatement: preparedStatement) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
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
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.startTransaction() { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Start a transaction.
    ///
    /// - Returns: A QueryResult representing the result of the operation
    public func startTransactionSync() -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        startTransaction() { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Commit the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of the commit transaction command has completed.
    public func commit(onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.commit() { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Commit the current transaction.
    ///
    /// - Returns: A QueryResult representing the result of the operation
    public func commitSync() -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        commit() { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Rollback the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of the rollback transaction command has completed.
    public func rollback(onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.rollback() { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Rollback the current transaction.
    ///
    /// - Returns: A QueryResult representing the result of the operation
    public func rollbackSync() -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        rollback() { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Create a savepoint.
    ///
    /// - Parameter savepoint: The name to  be given to the created savepoint.
    /// - Parameter onCompletion: The function to be called when the execution of the create savepoint command has completed.
    public func create(savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.create(savepoint: savepoint) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Create a savepoint.
    ///
    /// - Parameter savepoint: The name to  be given to the created savepoint.
    /// - Returns: A QueryResult representing the result of the operation
    public func createSync(savepoint: String) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        create(savepoint: savepoint) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Rollback the current transaction to the specified savepoint.
    ///
    /// - Parameter to savepoint: The name of the savepoint to rollback to.
    /// - Parameter onCompletion: The function to be called when the execution of the rollback transaction command has completed.
    public func rollback(to savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.rollback(to: savepoint) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Rollback the current transaction to the specified savepoint.
    ///
    /// - Parameter to savepoint: The name of the savepoint to rollback to.
    /// - Returns: A QueryResult representing the result of the operation
    public func rollbackSync(to savepoint: String) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        rollback(to: savepoint) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    /// Release a savepoint.
    ///
    /// - Parameter savepoint: The name of the savepoint to release.
    /// - Parameter onCompletion: The function to be called when the execution of the release savepoint command has completed.
    public func release(savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = self.connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.release(savepoint: savepoint) { result in
            self.runCompletionHandlerKeepingSelfAlive(result: result, onCompletion: onCompletion)
        }
    }

    /// Release a savepoint.
    ///
    /// - Parameter savepoint: The name of the savepoint to release.
    /// - Returns: A QueryResult representing the result of the operation
    public func releaseSync(savepoint: String) -> QueryResult {
        var result: QueryResult?
        let semaphore = DispatchSemaphore(value: 0)
        release(savepoint: savepoint) { res in
            result = res
            semaphore.signal()
        }
        semaphore.wait()
        guard let resultUnwrapped = result else {
            return .error(QueryError.noResult("No QueryResult from execute"))
        }
        return resultUnwrapped
    }

    // Offload the passed closure keeping self in scope
    // By calling this function to offload the passed closure we keep the connection wrapper in scope and prevent it being returned to the pool early by virtue of the fact self has to be captured in the calling closure.
    // The funxction also stores a reference to the wrapper on any ResultSet that is being returned which prevents a connection being returned to the pool until ResultSet.done() is called.
    private func runCompletionHandlerKeepingSelfAlive(result: QueryResult, onCompletion: @escaping ((QueryResult) -> ())) {
        if let resultSet = result.asResultSet {
            resultSet.connectionPoolWrapper = self
        }
        DispatchQueue.global().async {
            onCompletion(result)
        }
    }
}

public class DummyColumBuilder : ColumnCreator {
    public func buildColumn(for column: Column, using queryBuilder: QueryBuilder) -> String? {
        return nil
    }
}
