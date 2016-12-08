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

// MARK: Table

/// Subclasses of the Table class are metadata describing a table in a relational database that you want to work with.
open class Table: Buildable {
    private var _name = ""
    private var numberOfColumns = 0
    
    /// The alias of the table.
    public var alias: String?
    
    /// The name of the table to be used inside a query, i.e., either its alias (if exists)
    /// or its name.
    public var nameInQuery: String {
        if let alias = alias {
            return packName(alias)
        }
        return packName(_name)
    }

    /// Initialize an instance of Table.
    public required init() {
        let mirror = Mirror(reflecting: self)
        var columnsCount = 0
        for child in mirror.children {
            if let ch = child.value as? Column {
                ch.table = self
                columnsCount += 1
            }
            else if let label = child.label, label == "tableName" {
                _name = child.value as! String
            }
        }
        numberOfColumns = columnsCount
    }
    
    /// Build the table using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the table.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        if numberOfColumns == 0 {
            throw QueryError.syntaxError("No columns in the table. ")
        }
        if _name == "" {
            throw QueryError.syntaxError("Table name not set. ")
        }
        var result = packName(_name)
        if let alias = alias {
            result += " AS " + packName(alias)
        }
        return result
    }

    /// Add alias to the table, i.e., implement the SQL AS operator.
    ///
    /// - Parameter newName: A String containing the alias for the table.
    /// - Returns: A new Table instance with the alias.
    public func `as`(_ newName: String) -> Self {
        let new = type(of: self).init()
        new.alias = newName
        return new
    }

    /// Apply TRUNCATE TABLE query on the table.
    ///
    /// - Returns: An instance of `Raw`.
    public func truncate() -> Raw {
        return Raw(query: "TRUNCATE TABLE", table: self)
    }
    
    /// Apply DROP TABLE query on the table.
    ///
    /// - Returns: An instance of `Raw`.
    public func drop() -> Raw {
        return Raw(query: "DROP TABLE", table: self)
    }
}
