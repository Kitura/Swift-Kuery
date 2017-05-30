/**
 Copyright IBM Corporation 2016, 2017
 
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

// MARK: Connection protocol

/// Defines the protocol which all database plugins must implement.
public protocol Connection {
  
    /// The `QueryBuilder` with connection specific substitutions.
    var queryBuilder: QueryBuilder { get }
    
    /// Establish a connection with the database.
    ///
    /// - Parameter onCompletion: The function to be called when the connection is established.
    func connect(onCompletion: (QueryError?) -> ())

    /// Close the connection to the database.
    func closeConnection()
    
    /// An indication whether there is a connection to the database.
    var isConnected: Bool { get }
    
    /// Execute a query.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(query: Query, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a raw query.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(_ raw: String, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(query: Query, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a raw query with parameters.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(_ raw: String, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a query with parameters.
    ///
    /// - Parameter query: The query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(query: Query, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Execute a raw query with parameters.
    ///
    /// - Parameter query: A String with the query to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    func execute(_ raw: String, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Prepare statement.
    ///
    /// - Parameter query: The query to prepare statement for.
    /// - Returns: The prepared statement.
    /// - Throws: QueryError.syntaxError if query build fails, or a database error if it fails to prepare statement.
    func prepareStatement(_ query: Query) throws -> PreparedStatement

    /// Prepare statement.
    ///
    /// - Parameter raw: A String with the query to prepare statement for.
    /// - Returns: The prepared statement.
    /// - Throws: QueryError.syntaxError if query build fails, or a database error if it fails to prepare statement.
    func prepareStatement(_ raw: String) throws -> PreparedStatement

    /// Execute a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    func execute(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ()))

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: An array of the parameters.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    func execute(preparedStatement: PreparedStatement, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ()))

    /// Execute a prepared statement with parameters.
    ///
    /// - Parameter preparedStatement: The prepared statement to execute.
    /// - Parameter parameters: A dictionary of the parameters with parameter names as the keys.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    func execute(preparedStatement: PreparedStatement, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ()))

    /// Release a prepared statement.
    ///
    /// - Parameter preparedStatement: The prepared statement to release.
    /// - Parameter onCompletion: The function to be called when the execution has completed.
    func release(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Return a String representation of the query.
    ///
    /// - Parameter query: The query.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    func descriptionOf(query: Query) throws -> String
    
    /// Start a transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of start transaction command has completed.
    func startTransaction(onCompletion: @escaping ((QueryResult) -> ()))
    
    /// Commit the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of commit transaction command has completed.
    func commit(onCompletion: @escaping ((QueryResult) -> ()))

    /// Rollback the current transaction.
    ///
    /// - Parameter onCompletion: The function to be called when the execution of rolback transaction command has completed.
    func rollback(onCompletion: @escaping ((QueryResult) -> ()))

    /// Create a savepoint.
    ///
    /// - Parameter savepoint: The name to  be given to the created savepoint.
    /// - Parameter onCompletion: The function to be called when the execution of create savepoint command has completed.
    func create(savepoint: String, onCompletion: @escaping ((QueryResult) -> ()))

    /// Rollback the current transaction to the specified savepoint.
    ///
    /// - Parameter to savepoint: The name of the savepoint to rollback to.
    /// - Parameter onCompletion: The function to be called when the execution of rolback transaction command has completed.
    func rollback(to savepoint: String, onCompletion: @escaping ((QueryResult) -> ()))

    /// Release a savepoint.
    ///
    /// - Parameter savepoint: The name of the savepoint to release.
    /// - Parameter onCompletion: The function to be called when the execution of release savepoint command has completed.
    func release(savepoint: String, onCompletion: @escaping ((QueryResult) -> ()))    
}

public extension Connection {
    func execute(query: Query, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        do {
            let databaseQuery = try query.build(queryBuilder: queryBuilder)
            let (convertedQuery, namedToNumbered, count) = Utils.convertNamedParametersToNumbered(query: databaseQuery, queryBuilder: queryBuilder)
            var numberedParameters: [Any?] = Array(repeating: nil, count: count)
            for (parameterName, parameterValue) in parameters {
                if let numbers = namedToNumbered[parameterName] {
                    for number in numbers {
                        numberedParameters[number - 1] = parameterValue
                    }
                }
                else {
                    onCompletion(.error(QueryError.syntaxError("Failed to map parameters.")))
                }
            }
            execute(convertedQuery, parameters: numberedParameters, onCompletion: onCompletion)
        }
        catch  QueryError.syntaxError(let error) {
            onCompletion(.error(QueryError.syntaxError(error)))
        }
        catch {
            onCompletion(.error(QueryError.syntaxError("Failed to build the query.")))
        }
    }
}
