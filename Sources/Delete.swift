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

// MARK: Delete

/// The SQL DELETE statement.
public struct Delete: Query {
    /// The table to delete rows from.
    public let table: Table

    /// The SQL WHERE clause containing the filter for rows to delete.
    public private (set) var whereClause: Filter?

    /// A String containg the raw SQL WHERE clause to filter the rows to delete.
    public private (set) var rawWhereClause: String?
       
    /// Initialize an instance of Delete.
    ///
    /// - Parameter from: The table to delete rows from.
    /// - Parameter conditions: An optional where clause to apply.
    public init(from table: Table, where conditions: Filter?=nil) {
        self.table = table
        self.whereClause = conditions
    }
    
    /// Build the query using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        var result = "DELETE FROM " + table.build(queryBuilder: queryBuilder)
        if let whereClause = whereClause {
            result += try " WHERE " + whereClause.build(queryBuilder: queryBuilder)
        }
        else if let rawWhereClause = rawWhereClause {
            result += " WHERE " + rawWhereClause
        }
        return result
    }
    
    /// Add an SQL WHERE clause to the delete statement.
    ///
    /// - Parameter conditions: The SQL WHERE clause to apply.
    /// - Returns: A new instance of Delete.
    public func `where`(_ conditions: Filter) -> Delete {
        var new = self
        new.whereClause = conditions
        return new
    }

    /// Add a raw SQL WHERE clause to the delete statement.
    ///
    /// - Parameter conditions: A String containing the SQL WHERE clause to apply.
    /// - Returns: A new instance of Delete.
    public func `where`(_ raw: String) -> Delete {
        var new = self
        new.rawWhereClause = raw
        return new
    }
}
