/**
 Copyright IBM Corporation 2016
 
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

// MARK: Query protocol

/// Defines the protocol for queries.
public protocol Query: Buildable {
}

public extension Query {
    /// Execute the query.
    ///
    /// - Parameter connection: The plugin that implements the Connection protocol and executes the query.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ connection: Connection, onCompletion: @escaping ((QueryResult) -> ())) {
        connection.execute(query: self, onCompletion: onCompletion)
    }
    
    /// Execute the query with parameters.
    ///
    /// - Parameter connection: The plugin that implements the Connection protocol and executes the query.
    /// - Parameter parameters: An array of the query parameters.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func execute(_ connection: Connection, parameters: [Any], onCompletion: @escaping ((QueryResult) -> ())) {
        connection.execute(query: self, parameters: parameters, onCompletion: onCompletion)
    }
}
