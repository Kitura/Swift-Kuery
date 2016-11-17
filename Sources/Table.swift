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

/// Definition of table.
open class Table : Buildable {
    private var _name = ""
    
    /// The alias of the table.
    public var alias: String?
    
    /// Initialize an instance of Table.
    public required init() {
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let ch = child.value as? Column {
                ch.table = self
            }
            else if let label = child.label, label == "tableName" {
                _name = child.value as! String
            }
        }
    }
    
    /// Build the table using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the table.
    public func build(queryBuilder: QueryBuilder) -> String {
        var result = _name
        if let alias = alias {
            result += " AS " + alias
        }
        return result
    }

    /// Add alias to the table, i.e., implement SQL AS operator.
    ///
    /// - Parameter newName: A String containing the alias for the table.
    /// - Returns: A new Table instance with the alias.
    public func `as`(_ newName: String) -> Self {
        let new = type(of: self).init()
        new.alias = newName
        return new
    }
    
    /// Return the name of the table to be used inside query, i.e., either its alias (if exists)
    /// or its name.
    ///
    /// - Returns: A String containing the name of the table to be used inside query.
    public func nameInQuery() -> String {
        if let alias = alias {
            return alias
        }
        return _name
    }
}

/// Apply `Select` query on the table.
///
/// - Parameter fields: The fields to select from the table.
/// - Parameter table: The table to apply the query.
/// - Returns: An instance of `Select`.
public func select(_ fields: Field..., from table: Table) -> Select {
    return Select(fields: fields, from: table)
}

/// Apply `Delete` query on the table.
///
/// - Parameter from: The table to apply the query.
/// - Returns: An instance of `Delete`.
public func delete(from table: Table) -> Delete {
    return Delete(from: table)
}

/// Apply `Update` query on the table.
///
/// - Parameter table: The table to apply the query.
/// - Parameter set: An array of (column, value) tuples to set.
/// - Parameter conditions: An optional where clause to apply.
/// - Returns: An instance of `Update`.
public func update(_ table: Table, set: [(Column, Any)], conditions: Filter?=nil) -> Update {
    return Update(table, set: set, where: conditions)
}

/// Apply `Insert` query on the table.
///
/// - Parameter table: The table to apply the query.
/// - Parameter valueTuples: An array of (column, value) tuples to insert.
/// - Returns: An instance of `Insert`.
public func insert(into table: Table, valueTuples: [(Column, Any)]) -> Insert {
    return Insert(into: table, valueTuples: valueTuples)
}

/// Apply TRUNCATE TABLE query on the table.
///
/// - Parameter table: The table to apply the query.
/// - Returns: An instance of `Raw`.
public func truncate(table: Table) -> Raw {
    return Raw(query: "TRUNCATE TABLE", table: table)
}

/// Apply DROP TABLE query on the table.
///
/// - Parameter table: The table to apply the query.
/// - Returns: An instance of `Raw`.
public func drop(table: Table) -> Raw {
    return Raw(query: "DROP TABLE", table: table)
}

