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

/// An arbitrary query represented by a String.
public struct Raw: Query {
    /// A String containing the query.
    public var query: String
    
    /// The table to apply the query on.
    public var table: Table
    
    /// Initialize an instance of Raw.
    ///
    /// - Parameter query: A String containing the query.
    /// - Parameter table: The table to apply the query on.
    public init(query: String, table: Table) {
        self.query = query
        self.table = table
    }

    /// Build the query using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query.
    public func build(queryBuilder: QueryBuilder) -> String {
        return query + " " + table.build(queryBuilder: queryBuilder)
    }
}
