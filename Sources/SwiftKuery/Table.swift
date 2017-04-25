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

// MARK: Table

/// Subclasses of the Table class are metadata describing a table in a relational database that you want to work with.
open class Table: Buildable {
    var _name = ""
    private var numberOfColumns = 0
    
    /// The alias of the table.
    public private (set)  var alias: String?
    
    private var primaryKey: [Column]?
    private var foreignKeyColumns: [Column]?
    private var foreignKeyReferences: [Column]?
    private var syntaxError = ""
    
    /// The name of the table to be used inside a query, i.e., either its alias (if exists)
    /// or its name.
    public var nameInQuery: String {
        return alias ?? _name
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
        var result = Utils.packName(_name, queryBuilder: queryBuilder)
        if let alias = alias {
            result += " AS " + Utils.packName(alias, queryBuilder: queryBuilder)
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

    /// Create the table in the database.
    ///
    /// - Parameter connection: The connection to the database.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func create(connection: Connection, onCompletion: @escaping ((QueryResult) -> ())) {
        if syntaxError != "" {
            onCompletion(.error(QueryError.syntaxError(syntaxError)))
        }

        var columnsWithPrimaryKeyProperty = 0
        var columns = [Column]()
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let column = child.value as? Column {
                columns.append(column)
                if column.isPrimaryKey {
                    columnsWithPrimaryKeyProperty += 1
                }
            }
        }
        
        guard columns.count != 0 else {
            onCompletion(.error(QueryError.syntaxError("Table has no columns.")))
            return
        }
        
        guard (primaryKey == nil || columnsWithPrimaryKeyProperty == 0) && columnsWithPrimaryKeyProperty <= 1 else {
            onCompletion(.error(QueryError.syntaxError("Table has conflicting definitions of primary key.")))
            return
        }
        
        guard primaryKey == nil || primaryKey!.count > 0 else {
            onCompletion(.error(QueryError.syntaxError("Empty primary key.")))
            return
        }

        if foreignKeyColumns != nil || foreignKeyReferences != nil {
            guard let foreignKeyColumns = foreignKeyColumns, let foreignKeyReferences = foreignKeyReferences,
                foreignKeyColumns.count > 0, foreignKeyReferences.count > 0 else {
                    onCompletion(.error(QueryError.syntaxError("Invalid definition of foreign key.")))
                    return
            }
        }

        let queryBuilder = connection.queryBuilder
        
        do {
            var query = "CREATE TABLE " + Utils.packName(_name, queryBuilder: queryBuilder)
            query +=  " ("

            query += try columns.map { try $0.create(queryBuilder: queryBuilder) }.joined(separator: ", ")
     
            if let primaryKey = primaryKey {
                query += ", PRIMARY KEY ("
                query += primaryKey.map { Utils.packName($0.name, queryBuilder: queryBuilder) }.joined(separator: ", ")
                query += ")"
            }
            
            if let foreignKeyColumns = foreignKeyColumns, let foreignKeyReferences = foreignKeyReferences {
                query += ", FOREIGN KEY ("
                query += foreignKeyColumns.map { Utils.packName($0.name, queryBuilder: queryBuilder) }.joined(separator: ", ")
                query += ") REFERENCES "
                let referencedTableName = foreignKeyReferences[0].table._name
                query += Utils.packName(referencedTableName, queryBuilder: queryBuilder) + "("
                query += foreignKeyReferences.map { Utils.packName($0.name, queryBuilder: queryBuilder) }.joined(separator: ", ")
                query += ")"
            }
            
            query += ")"
            
            connection.execute(query, onCompletion: onCompletion)
        }
        catch {
            onCompletion(.error(QueryError.syntaxError("Failed to create table: \(error)")))
        }
    }
    
    /// Add a primary key to the table.
    ///
    /// - Parameter columns: An Array of columns that constitute the primary key.
    /// - Returns: A new instance of `Table`.
    public func primaryKey(_ columns: [Column]) -> Self {
        let new = type(of: self).init()
        if new.primaryKey != nil {
            new.syntaxError += "Conflicting definitions of primary key. "
        }
        else {
            new.primaryKey = columns
        }
        return new
    }
    
    /// Add a primary key to the table.
    ///
    /// - Parameter columns: Columns that constitute the primary key.
    /// - Returns: A new instance of `Table`.
    public func primaryKey(_ columns: Column...) -> Self {
        return primaryKey(columns)
    }
    
    /// Add a foreign key to the table.
    ///
    /// - Parameter columns: An Array of columns that constitute the foreign key.
    /// - Parameter references: An Array of columns of the foreign table the foreign key references.
    /// - Returns: A new instance of `Table`.
    public func foreignKey(_ columns: [Column], references: [Column]) -> Self {
        let new = type(of: self).init()
        if new.foreignKeyColumns != nil || new.foreignKeyReferences != nil {
            new.syntaxError += "Conflicting definitions of foreign key. "
        }
        else {
            new.foreignKeyColumns = columns
            new.foreignKeyReferences = references
        }
        return new
    }
    
    /// Add a foreign key to the table.
    ///
    /// - Parameter columns: A column that is the foreign key.
    /// - Parameter references: A column in the foreign table the foreign key references.
    /// - Returns: A new instance of `Table`.
    public func foreignKey(_ column: Column, references: Column) -> Self {
        return foreignKey([column], references: [references])
    }
}

