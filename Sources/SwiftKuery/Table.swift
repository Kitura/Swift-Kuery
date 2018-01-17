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

/**
 The `Table` class is used to represent a specific table from an SQL database in swift.
 This class details the table name, contains the `Column` instances present inside the table and provides methods to build SQL String descriptions for the various database engines.
 ### Usage Example: ###
 In this example, a ToDo table class matching a table stored in an SQL database is defined.
 The "ToDoTable" class contains the table name and three instances of the `Column` class.
 An instance of this "ToDoTable" class is then initialized.
 This instance is then referenced for a SQL select query to retrieve all data from a database.
 ```swift
 public class ToDoTable : Table {
    let tableName = "toDoTable"
    let toDo_id = Column("toDo_id", Int32.self, autoIncrement: true, primaryKey: true, notNull: true, unique: true)
    let toDo_title = Column("toDo_title", String.self, notNull: true)
    let toDo_completed = Column("toDo_completed", Bool.self, defaultValue: false)
 }
 
 public class Application {
    let todotable = ToDoTable()
    let selectQuery = Select(from :todotable)
 }
 ```
 */
open class Table: Buildable {
    var _name = ""
    // MARK: Parameters
    /// The columns inside the table.
    public private (set) var columns: [Column]
    private var columnsWithPrimaryKeyProperty = 0
    
    /// The alias of the table.
    public private (set) var alias: String?
    
    private var primaryKey: [Column]?
    private var foreignKeyColumns: [Column]?
    private var foreignKeyReferences: [Column]?
    private var syntaxError = ""
    
    /// The name of the table to be used inside a query, i.e., either its alias (if exists)
    /// or its name.
    public var nameInQuery: String {
        return alias ?? _name
    }
    
    // MARK: Initializer
    /// Initialize an instance of Table.
    public required init() {
        columns = [Column]()
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let column = child.value as? Column {
                column._table = self
                columns.append(column)
                if column.isPrimaryKey {
                    columnsWithPrimaryKeyProperty += 1
                }
            }
            else if let label = child.label, label == "tableName" {
                _name = child.value as! String
            }
        }
        verifyTableProperties()
    }

    /// Initialize an instance of Table with a table name
    /// and an array of Columns
    public required init(tableName: String, columns: [Column]) {
        self._name = tableName
        self.columns = columns
        for column in columns {
            column._table = self
            if column.isPrimaryKey {
                columnsWithPrimaryKeyProperty += 1
            }
        }
        verifyTableProperties()
    }

    /// Verifies that the properties have been correctly set
    private func verifyTableProperties() {
        if columns.count == 0 {
            syntaxError += "No columns in the table. "
        }
        if columnsWithPrimaryKeyProperty > 1 {
            syntaxError += "Conflicting definitions of primary key. "
        }
        if _name == "" {
            syntaxError += "Table name not set. "
        }
    }
    
    // MARK: String Representation
    /**
     Function to build a String representation for referencing a `Table` instance.
     A `QueryBuilder` is used handle variances between the various database engines and produce a correct SQL description.
     This function is required to obey the `Buildable` protocol.
     ### Usage Example: ###
     In this example, `QueryBuilder` and `Table` instances are initialized. (The ToDoTable() is defined in the class example).
     The build function is then called to produce a String description and print the results.
     ```swift
     let queryBuilder = QueryBuilder()
     let todotable = ToDoTable()
     let description = try todotable.build(queryBuilder: queryBuilder)
     print(description)
     //Prints toDoTable
     ```
     */
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the table.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        if columns.count == 0 {
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
    
    /// Function to create a String representation of a `Table` instance for use in an SQL CREATE TABLE query.
    /// - Returns: A String representation of the table create statement.
    /// - Throws: QueryError.syntaxError if statement build fails.
    public func description(connection: Connection) throws -> String {
        if syntaxError != "" {
            throw QueryError.syntaxError(syntaxError)
        }
        
        let queryBuilder = connection.queryBuilder
        
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
        return query
    }
    
    // MARK: Create Alias
    /**
     Function to return a copy of the current `Table` instance with the given name as its alias.
     This is equivalent to the SQL AS operator.
     ### Usage Example: ###
     In this example, a `Table` instance is created. An alias for this `Table` instance is then created and its alias printed.
     ```swift
     let todotable = ToDoTable()
     let aliasTable = todotable.as("new name")
     print(String(describing: aliasTable.alias))
     //Prints Optional("new name")
     ```
     */
    /// - Parameter newName: A String containing the alias for the table.
    /// - Returns: A new Table instance with the alias.
    public func `as`(_ newName: String) -> Self {
        let new = type(of: self).init()
        new.alias = newName
        return new
    }
    // MARK: Query Database

    /**
     Function to return a `Raw` instance, which will execute a TRUNCATE query on the current `Table` instance.
     ### Usage Example: ###
     In this example, a `Table` instance is created. The truncate function is called to create a `Raw` instance of an String to execute the TRUNCATE SQL Query for todotable.
     ```swift
     let todotable = ToDoTable()
     let truncateRaw = todotable.truncate()
     print(truncateRaw))
     //Prints Raw(query: "TRUNCATE TABLE", tables: [Application.ToDoTable])
     ```
     */
    /// - Returns: An instance of `Raw`.
    public func truncate() -> Raw {
        return Raw(query: "TRUNCATE TABLE", table: self)
    }
    
    /**
     Function to return a `Raw` instance, which will execute a DROP TABLE query on the current `Table` instance.
     ### Usage Example: ###
     In this example, a `Table` instance is created. The drop function is called to create a `Raw` instance of an String to execute the DROP TABLE SQL Query for todotable.
     ```swift
     let todotable = ToDoTable()
     let dropRaw = todotable.drop()
     print(dropRaw))
     //Prints Raw(query: "DROP TABLE", tables: [Application.ToDoTable])
     ```
     */
    /// - Returns: An instance of `Raw`.
    public func drop() -> Raw {
        return Raw(query: "DROP TABLE", table: self)
    }
    
    /**
     Function to create a table in an SQL database, with matching parameters to an instance of the `Table` class.
     ### Usage Example: ###
     In this example, a `Table` instance is created and a connection to an SQL database is established.
     The create function is called, sending an SQL query to create a matching table in the database.
     The `QueryResult` is then handled by "queryHandler", a function which processes the result.
     ```swift
     let todotable = ToDoTable()
     let SQLConnection = PostgreSQLConnection(host: "localhost", port: 5432, options: [.databaseName("ToDoDatabase")])
     todotable.create(connection: SQLConnection, onCompletion: queryHandler)
     ```
     */
    /// - Parameter connection: The connection to the database.
    /// - Parameter onCompletion: The function to be called when the execution of the query has completed.
    public func create(connection: Connection, onCompletion: @escaping ((QueryResult) -> ())) {
        do {
            let query = try description(connection: connection)
            connection.execute(query, onCompletion: onCompletion)
        }
        catch {
            onCompletion(.error(QueryError.syntaxError("\(error)")))
        }
    }
    // MARK: Assign Keys
    /**
     Function to set multiple `Column` instances, as a composite primary key, in the `Table` instance.
     The function also validates the columns to ensure they belong to the table and do not conflict with the definition of a primary key.
     ### Usage Example: ###
     In this example, columns for first and last name are initialized and a `Table` instance called personTable is created. The personTable primary key is then set to be a composite of firstColumn and lastColumn.
     ```swift
     let firstColumn = Column("firstName", String.self, notNull: true)
     let lastColumn = Column("lastName", String.self, notNull: true)
     public class PersonTable : Table {
        let tableName = "personTable"
        let firstName = firstColumn
        let lastName = lastColumn
        let dateOfBirth = Column("toDo_completed", String.self)
     }
     var personTable = PersonTable()
     personTable = personTable.primaryKey([firstColumn, lastColumn])
     ```
     */
    /// - Parameter columns: An Array of columns that constitute the primary key.
    /// - Returns: A new instance of `Table`.
    public func primaryKey(_ columns: [Column]) -> Self {
        if primaryKey != nil || columnsWithPrimaryKeyProperty > 0 {
            syntaxError += "Conflicting definitions of primary key. "
        }
        else if columns.count == 0 {
            syntaxError += "Empty primary key. "
        }
        else if !Table.columnsBelongTo(table: self, columns: columns) {
            syntaxError += "Primary key contains columns from another table. "
        }
        else {
            primaryKey = columns
        }
        return self
    }
    
    /**
     Function to set a single `Column` instances` as a primary key, in the `Table` instance.
     This function calls the composite primaryKey function with a single column to create a single primary key.
     ### Usage Example: ###
     In this example, a column for id is initialized and a `Table` instance called "personTable" is created.
     The personTable primary key is then set to be "idColumn".
     ```swift
     let idColumn = Column("id", Int32.self, notNull: true)
     public class PersonTable : Table {
        let tableName = "personTable"
        let id = idColumn
        let firstName = Column("firstName", String.self, notNull: true)
        let lastName = Column("lastName", String.self, notNull: true)
     }
     var personTable = PersonTable()
     personTable = personTable.primaryKey(idColumn)
     ```
     */
    /// - Parameter columns: Single Column that constitute the primary key.
    /// - Returns: A new instance of `Table`.
    public func primaryKey(_ columns: Column...) -> Self {
        return primaryKey(columns)
    }
    
    /**
     Function to set multiple `Column` instances, as a composite foreign key, in the `Table` instance.
     This function calls the composite primaryKey function with a single column to create a single primary key.
     ### Usage Example: ###
     In this example, columns for first and last name are initialized and a `Table` instance called personTable is created. A "personTable" foreign key is then set to be a composite of firstColumn and lastColumn, which reference columns describing the persons salary.
     ```swift
     let firstColumn = Column("firstName", String.self, notNull: true)
     let lastColumn = Column("lastName", String.self, notNull: true)
     let monthlyPay = Column("monthlyPay", Int32.self)
     let employeeBand = Column("employeeBand", String.self)
     public class PersonTable : Table {
        let tableName = "personTable"
        let firstName = firstColumn
        let lastName = lastColumn
        let dateOfBirth = Column("toDo_completed", String.self)
     }
     var personTable = PersonTable()
     personTable = personTable.foreignKey([firstColumn, lastColumn], references: [monthlyPay, employeeBand])
     ```
     */
    /// - Parameter columns: An Array of columns that constitute the foreign key.
    /// - Parameter references: An Array of columns of the foreign table the foreign key references.
    /// - Returns: A new instance of `Table`.
    public func foreignKey(_ columns: [Column], references: [Column]) -> Self {
        if foreignKeyColumns != nil || foreignKeyReferences != nil {
            syntaxError += "Conflicting definitions of foreign key. "
        }
        else if columns.count == 0 || references.count == 0 || columns.count != references.count {
            syntaxError += "Invalid definition of foreign key. "
        }
        else if !Table.columnsBelongTo(table: self, columns: columns) {
            syntaxError += "Foreign key contains columns from another table. "
        }
        else if !Table.columnsBelongTo(table: references[0].table, columns: references) {
            syntaxError += "Foreign key references columns from more than one table. "
        }
        else {
            foreignKeyColumns = columns
            foreignKeyReferences = references
        }
        return self
    }
    
    private static func columnsBelongTo(table: Table, columns: [Column]) -> Bool {
        for column in columns {
            if column.table._name != table._name {
                return false
            }
        }
        return true
    }
    
    /**
     Function to set a single `Column` instances, as a composite foreign key, in the `Table` instance.
     The function also validates the columns to ensure they belong to the table and do not conflict with the definition of a foreign key.
     ### Usage Example: ###
     In this example, a column for id is initialized and a `Table` instance called "personTable" is created.
     The personTable foreign key is then set to be firstColumn, referencing columns describing the persons salary.
     ```swift
     let idColumn = Column("id", Int32.self, notNull: true)
     let monthlyPay = Column("monthlyPay", Int32.self)
     let employeeBand = Column("employeeBand", String.self)
     public class PersonTable : Table {
        let tableName = "personTable"
        let id = idColumn
        let firstName = Column("firstName", String.self, notNull: true)
        let lastName = Column("lastName", String.self, notNull: true)
     }
     var personTable = PersonTable()
     personTable = personTable.foreignKey(idColumn, references: [monthlyPay, employeeBand])
     ```
     */
    /// - Parameter columns: A column that is the foreign key.
    /// - Parameter references: A column in the foreign table the foreign key references.
    /// - Returns: A new instance of `Table`.
    public func foreignKey(_ column: Column, references: Column) -> Self {
        return foreignKey([column], references: [references])
    }
}
