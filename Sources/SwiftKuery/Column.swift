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

// MARK: Column

/// Definition of table column.
public class Column: Field {
    /// The name of the column.
    public let name: String
    
    /// The alias of the column.
    public var alias: String?
    
    /// The table to which the column belongs.
    public weak var table: Table!
    
    public let type: SQLDataType.Type?
    public let isPrimaryKey: Bool
    public let isNotNullable: Bool
    public let isUnique: Bool
    public let defaultValue: Any?
    // check
    // collate
    // on conflict (per constraint)
    

    /// Initialize an instance of Column.
    ///
    /// - Parameter name: The name of the column.
    public init(_ name: String, type: SQLDataType.Type? = nil, isPrimaryKey: Bool = false, isNotNullable: Bool = false, isUnique: Bool = false, defaultValue: Any? = nil) {
        self.name = name
        self.type = type
        self.isPrimaryKey = isPrimaryKey
        self.isNotNullable = isNotNullable
        self.isUnique = isUnique
        self.defaultValue = defaultValue
    }
    
    /// Build the column using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the column.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        let tableName = Utils.packName(table.nameInQuery, queryBuilder: queryBuilder)
        if tableName == "" {
            throw QueryError.syntaxError("Table name not set. ")
        }
        var result = tableName + "." + Utils.packName(name, queryBuilder: queryBuilder)
        if let alias = alias {
            result += " AS " + Utils.packName(alias, queryBuilder: queryBuilder)
        }
        return result
    }

    /// Add an alias to the column, i.e., implement the SQL AS operator.
    ///
    /// - Parameter newName: A String containing the alias for the column.
    /// - Returns: A new Column instance with the alias.
    public func `as`(_ newName: String) -> Column {
        let new = Column(name, type: type, isPrimaryKey: isPrimaryKey, isNotNullable: isNotNullable, isUnique: isUnique, defaultValue: defaultValue)
        new.alias = newName
        new.table = table
        return new
    }
    
    /// Return database specific description of the column using `QueryBuilder` to be used in CREATE TABLE.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the column.
    /// - Throws: QueryError.syntaxError if column creation fails.
    public func create(queryBuilder: QueryBuilder) throws -> String {
        guard let type = type else {
            throw QueryError.syntaxError("Column type not set for column \(name). ")
        }
        
        var result = name + " " + type.create(queryBuilder: queryBuilder)
        if isPrimaryKey {
            result += " PRIMARY KEY"
        }
        if isNotNullable {
            result += " NULL"
        }
        if isUnique {
            result += " UNIQUE"
        }
        if let defaultValue = defaultValue {
            result += " DEFAULT " + Utils.packType(defaultValue)
        }
        return result
    }
}

