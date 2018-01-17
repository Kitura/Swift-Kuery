/**
 Copyright IBM Corporation 2017
 
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

// MARK: ConnectionPoolConnection

/**
 This class uses a `Connection` instance and a `ConnectionPool` instance to implements a wrapper for the `Connection` class.
 It implements the functions of the `Connection` protocol, in addition to the `closeConnection()` function
 for releasing a `Connection` instance from the `ConnectionPool`.
 It is usually initialised by the `ConnectionPool` instance.
 ### Usage Example: ###
 In this example, a `ConnectionPool` instance is initialized (parameters defined in docs for `ConnectionPool`).
 A `ConnectionPoolConnection` instance called "connection" is then returned by calling "getConnection()" on "connectionPool".
 The closeConnection() function is then called on connection to release it from the pool.
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
        return connection?.queryBuilder ?? QueryBuilder()
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
    public func connect(onCompletion: (QueryError?) -> ()) {
        if let _ = connection {
            onCompletion(nil)
        }
        else {
            if let newConnection = pool?.getConnection() {
                connection = newConnection
                onCompletion(nil)
            }
            else {
                onCompletion(.connection("Failed to get connection"))
            }
        }
    }
    
    /**
     Close the connection to the database.
     ### Usage Example: ###
     In this example, The closeConnection() function is called on a `ConnectionPoolConnection` instance called "connection" to release it from it's `ConnectionPool` instance.
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
     In this example, The isConnected() function is called on a `ConnectionPoolConnection` instance called "connection" and returns a true value, which is then printed.
     ```swift
     let connected = connection.isConnected()
     print(connected)
     // Prints true
     ```
     */
    /// - Returns: A boolean value, for whether the connection is connected.
    public var isConnected: Bool {
        return connection?.isConnected ?? false
    }
    
    // MARK: Execute Querys
    /// Execute a query.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(query: Query, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(query: query, onCompletion: onCompletion)
    }
    
    /// Execute a raw query.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(raw, onCompletion: onCompletion)
    }
    
    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(query: Query, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(query: query, parameters: parameters, onCompletion: onCompletion)
    }
    
    /// Execute a raw query with parameters.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(raw, parameters: parameters, onCompletion: onCompletion)
    }
    
    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(query: Query, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(query: query, parameters: parameters, onCompletion: onCompletion)
    }
    
    /// Execute a raw query with parameters.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ raw: String, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(raw, parameters: parameters, onCompletion: onCompletion)
    }
    
    // MARK: Prepared statements

    /// Prepare statement.
    ///
    /// - Parameter query: The query to prepare statement for.
    /// - Returns: The prepared statement.
    /// - Throws: QueryError.syntaxError if query build fails, or a database error if it fails to prepare statement.
    public func prepareStatement(_ query: Query) throws -> PreparedStatement {
        guard let connection = connection else {
            throw QueryError.connection("Connection is disconnected")
        }
        return try connection.prepareStatement(query)
    }
    
    /// Prepare statement.
    ///
    /// - Parameter raw: A String with the query to prepare statement for.
    /// - Returns: The prepared statement.
    /// - Throws: QueryError.syntaxError if query build fails, or a database error if it fails to prepare statement.
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
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(preparedStatement: preparedStatement, onCompletion: onCompletion)
    }
    
    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func execute(preparedStatement: PreparedStatement, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(preparedStatement: preparedStatement, parameters: parameters, onCompletion: onCompletion)
    }

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func execute(preparedStatement: PreparedStatement, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.execute(preparedStatement: preparedStatement, parameters: parameters, onCompletion: onCompletion)
    }

    /// Release a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to release.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    public func release(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.release(preparedStatement: preparedStatement, onCompletion: onCompletion)
    }

    /// Return a String representation of the query.
    ///
    /// - Parameter query: The query.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
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
    /// - Parameter onCompletion: The function to be called when the execution of start transaction command has completed.
    public func startTransaction(onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.startTransaction(onCompletion: onCompletion)
    }
    
    /// Commit the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of commit transaction command has completed.
    public func commit(onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.commit(onCompletion: onCompletion)
    }
    
    /// Rollback the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of rolback transaction command has completed.
    public func rollback(onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.rollback(onCompletion: onCompletion)
    }
    
    /// Create a savepoint.
    ///
    /// - Parameter savepoint: The name to  be given to the created savepoint.
    /// - Parameter onCompletion: The function to be called when the execution of create savepoint command has completed.
    public func create(savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.create(savepoint: savepoint, onCompletion: onCompletion)
    }
    
    /// Rollback the current transaction to the specified savepoint.
    ///
    /// - Parameter to savepoint: The name of the savepoint to rollback to.
    /// - Parameter onCompletion: The function to be called when the execution of rolback transaction command has completed.
    public func rollback(to savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.rollback(to: savepoint, onCompletion: onCompletion)
    }
    
    /// Release a savepoint.
    ///
    /// - Parameter savepoint: The name of the savepoint to release.
    /// - Parameter onCompletion: The function to be called when the execution of release savepoint command has completed.
    public func release(savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {
        guard let connection = connection else {
            onCompletion(.error(QueryError.connection("Connection is disconnected")))
            return
        }
        connection.release(savepoint: savepoint, onCompletion: onCompletion)
    }
}
