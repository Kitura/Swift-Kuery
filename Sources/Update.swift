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

// MARK: Update

/// The SQL UPDATE statement.
public struct Update: Query {
    /// The table to update.
    public let table: Table

    /// The SQL WHERE clause containing the filter for the rows to update.
    /// Could be represented with a `Filter` clause or a `String` containing raw SQL.
    public private (set) var whereClause: QueryFilterProtocol?
    
    /// A `Returning` enum value corresponding to the SQL RETURNING clause.
    public private (set) var returningClause: Returning?
    
    private let valueTuples: [(Column, Any)]
    
    private var syntaxError = ""
    
    /// Initialize an instance of Update.
    ///
    /// - Parameter table: The table to update.
    /// - Parameter set: An array of (column, value) tuples to set.
    /// - Parameter conditions: An optional where clause to apply.
    public init(_ table: Table, set: [(Column, Any)], where conditions: QueryFilterProtocol?=nil) {
        self.table = table
        self.valueTuples = set
        self.whereClause = conditions
        if set.count == 0 {
            syntaxError = "An empty set of (column, value) tuples. "
        }
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
        var result = try "UPDATE " + table.build(queryBuilder: queryBuilder)
        result += try " SET " + valueTuples.map {
            column, value in "\(column.name) = \(try packType(value, queryBuilder: queryBuilder))"
            }.joined(separator: ", ")
        if let whereClause = whereClause {
            result += try " WHERE " + whereClause.build(queryBuilder: queryBuilder)
        }
        if let returning = returningClause {
            result += try " RETURNING " + returning.build(queryBuilder: queryBuilder)
        }
        result = updateParameterNumbers(query: result, queryBuilder: queryBuilder)
        return result
    }
    
    /// Add an SQL WHERE clause to the update statement.
    ///
    /// - Parameter conditions: The `Filter` clause or a `String` containing the SQL WHERE to apply.
    /// - Returns: A new instance of Update.
    public func `where`(_ conditions: QueryFilterProtocol) -> Update {
        var new = self
        if whereClause != nil {
            new.syntaxError += "Multiple where clauses. "
        }
        else {
            new.whereClause = conditions
        }
        return new
    }
    
    /// Add an SQL RETURNING clause to the update statement.
    ///
    /// - Parameter columns: An optionl array of `Column`s to be returned. If not specified, all columns are returned.
    /// - Returns: A new instance of Update.
    public func returning(_ columns: [Column]?=nil) -> Update {
        var new = self
        if returningClause != nil {
            new.syntaxError += "Multiple returning clauses. "
        }
        else {
            if let columns = columns {
                new.returningClause = Returning.columns(columns)
            }
            else {
                new.returningClause = Returning.all
            }
        }
        return new
    }
    
    /// Add an SQL RETURNING clause to the update statement.
    ///
    /// - Parameter columns: A list of `Column`s to be returned.
    /// - Returns: A new instance of Update.
    public func returning(_ columns: Column...) -> Update {
        var new = self
        if returningClause != nil {
            new.syntaxError += "Multiple returning clauses. "
        }
        else {
            new.returningClause = Returning.columns(columns)
        }
        return new
    }

}
