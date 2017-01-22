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

// MARK: Delete

/// The SQL DELETE statement.
public struct Delete: Query {
    /// The table to delete rows from.
    public let table: Table

    /// The SQL WHERE clause containing the filter for rows to delete.
    /// Could be represented with a `Filter` clause or a `String` containing raw SQL.
    public private (set) var whereClause: QueryFilterProtocol?

    /// A String with a clause to be appended to the end of the query.
    public private (set) var suffix: QuerySuffixProtocol?
    
    private var syntaxError = ""

    /// Initialize an instance of Delete.
    ///
    /// - Parameter from: The table to delete rows from.
    /// - Parameter conditions: An optional where clause to apply.
    public init(from table: Table, where conditions: QueryFilterProtocol?=nil) {
        self.table = table
        self.whereClause = conditions
    }
    
    /// Build the query using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        if syntaxError != "" {
            throw QueryError.syntaxError(syntaxError)
        }
        var result = try "DELETE FROM " + table.build(queryBuilder: queryBuilder)
        if let whereClause = whereClause {
            result += try " WHERE " + whereClause.build(queryBuilder: queryBuilder)
        }
        if let suffix = suffix {
            result += try " " + suffix.build(queryBuilder: queryBuilder)
        }
        result = updateParameterNumbers(query: result, queryBuilder: queryBuilder)
        return result
    }
    
    /// Add an SQL WHERE clause to the delete statement.
    ///
    /// - Parameter conditions: The `Filter` clause or a `String` containing SQL WHERE clause to apply.
    /// - Returns: A new instance of Delete.
    public func `where`(_ conditions: QueryFilterProtocol) -> Delete {
        var new = self
        if whereClause != nil {
            new.syntaxError += "Multiple where clauses. "
        }
        else {
            new.whereClause = conditions
        }
        return new
    }
    
    /// Add a raw suffix to the delete statement.
    ///
    /// - Parameter raw: A String with a clause to be appended to the end of the query.
    /// - Returns: A new instance of Delete.
    public func suffix(_ raw: String) -> Delete {
        var new = self
        if suffix != nil {
            new.syntaxError += "Multiple suffixes. "
        }
        else {
            new.suffix = raw
        }
        return new
    }

}
