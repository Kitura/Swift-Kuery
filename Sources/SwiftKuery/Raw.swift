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

// MARK: Raw

/// An arbitrary query represented by a String. The generated query will be a concatenation of the 
/// supplied query string and tables.
public struct Raw: Query {
    /// A String containing the query.
    public let query: String
    
    /// The table to apply the query on.
    public let tables: [Table]
    
    /// Initialize an instance of Raw.
    ///
    /// - Parameter query: A String containing the query.
    /// - Parameter table: The table(s) to apply the query on.
    public init(query: String, table: Table...) {
        self.init(query: query, tables: table)
    }

    /// Initialize an instance of Raw.
    ///
    /// - Parameter query: A String containing the query.
    /// - Parameter tables: An array of tables to apply the query on.
    public init(query: String, tables: [Table]) {
        self.query = query
        self.tables = tables
    }

    /// Build the query using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        return try query + " " + "\(tables.map { try $0.build(queryBuilder: queryBuilder) }.joined(separator: ", "))"
    }
}
