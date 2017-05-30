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
public class Column: Field, IndexColumn {
    /// The name of the column.
    public let name: String
    
    /// The alias of the column.
    public var alias: String?
    
    /// The table to which the column belongs.
    weak var _table: Table!
    
    /// The type of the column.
    public let type: SQLDataType.Type?
    
    /// The length of the column values according to the type.
    public let length: Int?
    
    /// An indication whether the column is the primary key of the table.
    public let isPrimaryKey: Bool
    
    /// An indication whether the column is not nullable.
    public let isNotNullable: Bool
    
    /// An indication whether the column values have to be unique.
    public let isUnique: Bool
    
    /// The default value of the column.
    public let defaultValue: Any?
    
    /// An indication whether the column autoincrements.
    public let autoIncrement: Bool
    
    /// The expression to check for values inserted into of the column.
    public let checkExpression: String?
    
    /// The collation rule for the column.
    public let collate: String?
    
    /// The table to which the column belongs.
    public var table: Table {
        return _table
    }
    
    /// Initialize an instance of Column.
    ///
    /// - Parameter name: The name of the column.
    /// - Parameter type: The type of the column.
    /// - Parameter length: The length of the column values according to the type.
    /// - Parameter autoIncrement: An indication whether the column autoincrements.
    /// - Parameter primaryKey: An indication whether the column is the primary key of the table.
    /// - Parameter notNull: An indication whether the column is not nullable.
    /// - Parameter unique: An indication whether the column values have to be unique.
    /// - Parameter defaultValue: The default value of the column.
    /// - Parameter check: The expression to check for values inserted into of the column.
    /// - Parameter collate: The collation rule for the column.
    public init(_ name: String, _ type: SQLDataType.Type? = nil, length: Int? = nil, autoIncrement: Bool = false, primaryKey: Bool = false, notNull: Bool = false, unique: Bool = false, defaultValue: Any? = nil, check: String? = nil, collate: String? = nil) {
        self.name = name
        self.type = type
        self.length = length
        self.autoIncrement = autoIncrement
        self.isPrimaryKey = primaryKey
        self.isNotNullable = notNull
        self.isUnique = unique
        self.defaultValue = defaultValue
        self.checkExpression = check
        self.collate = collate
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

    /// Build the index column using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the index column.
    public func buildIndex(queryBuilder: QueryBuilder) -> String {
        return Utils.packName(name, queryBuilder: queryBuilder)
    }

    /// Add an alias to the column, i.e., implement the SQL AS operator.
    ///
    /// - Parameter newName: A String containing the alias for the column.
    /// - Returns: A new Column instance with the alias.
    public func `as`(_ newName: String) -> Column {
        let new = Column(name, type, length: length, primaryKey: isPrimaryKey, notNull: isNotNullable, unique: isUnique, defaultValue: defaultValue, collate: collate)
        new.alias = newName
        new._table = table
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
        
        var result = Utils.packName(name, queryBuilder: queryBuilder) + " "
        
        var typeString = type.create(queryBuilder: queryBuilder)
        if let length = length {
            typeString += "(\(length))"
        }
        if autoIncrement {
            if let createAutoIncrement = queryBuilder.createAutoIncrement {
                let autoIncrementString = createAutoIncrement(typeString)
                guard autoIncrementString != "" else {
                    throw QueryError.syntaxError("Invalid autoincrement for column \(name). ")
                }
                result += autoIncrementString
            }
            else {
                result += typeString + " AUTO_INCREMENT"
            }
        }
        else {
            result += typeString
        }
        
        if isPrimaryKey {
            result += " PRIMARY KEY"
        }
        if isNotNullable {
            result += " NOT NULL"
        }
        if isUnique {
            result += " UNIQUE"
        }
        if let defaultValue = defaultValue {
            result += " DEFAULT " + Utils.packType(defaultValue)
        }
        if let checkExpression = checkExpression {
            result += " CHECK (" + checkExpression + ")"
        }
        if let collate = collate {
            result += " COLLATE \"" + collate + "\""
        }
        return result
    }
}

