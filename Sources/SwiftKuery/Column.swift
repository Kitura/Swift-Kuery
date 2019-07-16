/**
 Copyright IBM Corporation 2016, 2017, 2018, 2019
 
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

/**
 The `Column` class is used to represent a single column in an SQL table in Swift.
 A combination of columns are used to construct a `Table` class which matches a specific table in an SQL database.
 The `Column` class details the column name, the table the column belongs to, any SQL keywords which apply to the column and the data type of the column.
### Usage Example: ###
In this example, a person `Table` class, containing three instances of the `Column` class, is defined.
 ```swift
 public class PersonTable : Table {
     let tableName = "personTable"
     let person_id = Column("person_id", Int32.self, autoIncrement: true, primaryKey: true, notNull: true, unique: true)
     let name = Column("name", String.self, notNull: true)
     let monthlyPay = Column("monthlyPay", Int32.self)
 }
 ```
 */
public class Column: Field, IndexColumn {
    // MARK: Column Parameters
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

    /// Property denoting whether default value is NULL
    /// If set to true a `nil` value for the `defaultValue` property will be interpreted as `NULL`
    public let nullDefaultValue: Bool
    
    /// An indication whether the column autoincrements.
    public let autoIncrement: Bool
    
    /// A boolean expression constraint, which values inserted into the column will be checked against.
    public let checkExpression: String?
    
    /// The collation rule for the column.
    public let collate: String?

    /// Indicates whether this is a last updated timestamp column
    public let lastUpdated: Bool?

    /// Indicates whether this is a created at timestamp column
    public let createdAt: Bool?
    
    /// The table to which the column belongs.
    public var table: Table {
        return _table
    }
    
    // MARK: Column Initializer
    
    /**
     The initializer for the `Column` class. This creates an instance of `Column` using the provided parameters.
     Name must be provided, but all other fields will default to either nil or false if not given.
     ### Usage Example: ###
     In this example, an instance of the `Column` class is created to match the person_id column of an SQL table.
     To represent this a `Column` is initialised with name set to "person_id", type set as Int32.self (self is required to pass Int32 as the class) and primaryKey properties set to true.
     ```swift
     let person_id = Column("person_id", Int32.self, autoIncrement: true, primaryKey: true, notNull: true, unique: true)
     ```
 
     - Parameter name: The name of the column.
     - Parameter type: The type of the column. Defaults to nil.
     - Parameter length: The length of the column values according to the type. Defaults to nil.
     - Parameter autoIncrement: An indication whether the column autoincrements. Defaults to false.
     - Parameter primaryKey: An indication whether the column is the primary key of the table. Defaults to false.
     - Parameter notNull: An indication whether the column is not nullable. Defaults to false.
     - Parameter unique: An indication whether the column values have to be unique. Defaults to false.
     - Parameter defaultValue: The default value of the column. Defaults to nil.
     - Parameter nullDefaultValue: Property denoting whether default value is NULL. Defaults to false.
     - Parameter check: The expression to check for values inserted into the column. Defaults to nil.
     - Parameter collate: The collation rule for the column. Defaults to nil.
     - Parameter lastUpdated: An indication whether the column is a timestamp for last update
     - Parameter createdAt: An indication whether the column is a timestamp for created at
     */
    public init(_ name: String, _ type: SQLDataType.Type? = nil, length: Int? = nil, autoIncrement: Bool = false, primaryKey: Bool = false, notNull: Bool = false, unique: Bool = false, defaultValue: Any? = nil, nullDefaultValue: Bool = false, check: String? = nil, collate: String? = nil, lastUpdated: Bool? = nil, createdAt: Bool? = nil) {
        self.name = name
        self.type = type
        self.length = length
        self.autoIncrement = autoIncrement
        self.isPrimaryKey = primaryKey
        self.isNotNullable = notNull
        self.isUnique = unique
        self.defaultValue = defaultValue
        self.nullDefaultValue = nullDefaultValue
        self.checkExpression = check
        self.collate = collate
        self.lastUpdated = lastUpdated
        self.createdAt = createdAt
    }
    
    //MARK: Column Decription Functions
    
    /**
     Function to build a String representation for referencing a `Column` instance.
     A `QueryBuilder` is used to handle variances between the various database engines and produce a correct SQL description.
     This function is required to conform to the `Buildable` protocol.
     ### Usage Example: ###
     In this example, `QueryBuilder` and a `PersonTable` (as defined at the top of this class) instances are initialized.
     The build function is then called to produce a String description and the results are printed.
     ```swift
     let queryBuilder = QueryBuilder()
     let personTable = PersonTable()
     let description = try personTable.name.build(queryBuilder: queryBuilder)
     print(description)
     // Prints personTable.name
     ```
    
     - Parameter queryBuilder: The QueryBuilder to use.
     - Returns: A String representation of the column.
     - Throws: QueryError.syntaxError if query build fails.
    */
    public func build(queryBuilder: QueryBuilder) throws -> String {
        let tableName = table.nameInQuery
        if tableName == "" {
            throw QueryError.syntaxError("Table name not set. ")
        }
        var result = Utils.packName(tableName, queryBuilder: queryBuilder) + "." + Utils.packName(name, queryBuilder: queryBuilder)
        if let alias = alias {
            result += " AS " + Utils.packName(alias, queryBuilder: queryBuilder)
        }
        return result
    }
    
    /**
     Function to build a String representation of the index of a `Column` instance.
     A `QueryBuilder` is used to handle variances between the various database engines and produce a correct SQL description.
     ### Usage Example: ###
     In this example, `QueryBuilder` and `PersonTable` (as defined at the top of this class) instances are initialized.
     The build function is then called to produce a String representation of the buildIndex and the results are printed.
     ```swift
     let queryBuilder = QueryBuilder()
     let personTable = PersonTable()
     let description = personTable.name.buildIndex(queryBuilder: queryBuilder)
     print(description)
     // Prints name
     ```
    
     - Parameter queryBuilder: The QueryBuilder to use.
     - Returns: A String representation of the index column.
    */
    public func buildIndex(queryBuilder: QueryBuilder) -> String {
        return Utils.packName(name, queryBuilder: queryBuilder)
    }

    /**
     Function to create a String representation of a `Column` instance for use in an SQL CREATE TABLE query.
     A `QueryBuilder` is used to handle variances between the various database engines and produce a correct SQL description.
     ### Usage Example: ###
     In this example, `QueryBuilder` and a `PersonTable` (as defined at the top of this class) instances are initialized.
     The create function is then used to produce a String description of the `Column` and print the results.
     ```swift
     let queryBuilder = QueryBuilder()
     let personTable = PersonTable()
     let description = try personTable.person_id.create(queryBuilder: queryBuilder)
     print(description)
     // Prints "person_id integer AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE"
     ```
    
     - Parameter queryBuilder: The QueryBuilder to use.
     - Returns: A String representation of the column.
     - Throws: QueryError.syntaxError if column creation fails.
    */
    public func create(queryBuilder: QueryBuilder) throws -> String {
        guard let result = queryBuilder.columnBuilder.buildColumn(for: self, using: queryBuilder) else {
            throw QueryError.syntaxError("Invalid column attributes for column \(name). ")
        }
        return result
    }
    
    //MARK: Column Expressions

    /**
     Function to return a copy of the current `Column` instance with the given name as its alias.
     This is equivalent to the SQL AS operator.
     ### Usage Example: ###
     In this example, a `PersonTable` (as defined at the top of this class) instance is created which contains a `Column`.
     An alias for this `Column` instance is then created and its alias printed.
     ```swift
     let personTable = PersonTable()
     let aliasColumn = personTable.name.as("new name")
     print(String(describing: aliasColumn.alias))
     // Prints Optional("new name")
     ```

     - Parameter newName: A String containing the alias for the column.
     - Returns: A new Column instance with the alias.
    */
    public func `as`(_ newName: String) -> Column {
        let new = Column(name, type, length: length, autoIncrement: autoIncrement,
                         primaryKey: isPrimaryKey, notNull: isNotNullable, unique: isUnique,
                         defaultValue: defaultValue, nullDefaultValue: nullDefaultValue, check: checkExpression, collate: collate)
        new.alias = newName
        new._table = table
        return new
    }

}

