/**
 Copyright IBM Corporation 2017
 
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

// MARK: Migration

/**
 A class to help with migration between two versions of a table.
 
 ### Usage Example: ###
 The suggested usage is to keep versions of the table classes somewhere in the application code:
 ```swift
 public class MyTable_v0: Table {
     let a = Column("a", ...)
     let b = Column("b", ...)
     let tableName = "MyTable"
 }
 public class MyTable_v1: Table {
     let b = Column("b", ...)
     let c = Column("c", ...)
     let tableName = "MyTable"
 }
 ```
 And use a typealias to refer to the current version of the table class in the application:
 ```swift
 typealias MyTable = MyTable_v0
 let t = MyTable()
 let q = Select(from: t)
 ...
 ```
 The migration code from v0 to v1 should be something like this:
 ```swift
 let t0 = MyTable_v0()
 let t1 = MyTable_v1()
 let migration0 = Migration(from: t0, to: t1, using: connection)
 migration0.alterTableAdd(column: t1.c) { result in ... }
 ```
 And raw alternations, if needed:
 ```swift
 let dropColumnQuery = "ALTER TABLE " + t1.tableName + " DROP COLUMN " + t0.a.name
 connection.execute(dropColumnQuery) { result in ... }
 ```
*/
public class Migration {
    
    private let connection: Connection
    private let table1: Table
    private let table2: Table
    private var renamed = false
    
    // MARK: Initializer
    /**
     Initialize an instance of `Migration` with the tables you are migrating between
     and the connection to the database, where the tables are located.
     ### Usage Example: ###
     
     ```swift
     let connection = getConnection()
     let oldTable = MyTable_v0()
     let newTable = MyTable_v1()
     let migration = Migration(from: oldTable, to: newTable, using: connection)
     ```
    
     - Parameter from: The version of the table to migrate from.
     - Parameter to: The version of the table to migrate to.
     - Parameter using conenction: The connection to the database to use.
    */
    public init(from: Table, to: Table, using connection: Connection) {
        self.connection = connection
        table1 = from
        table2 = to
    }
    // MARK: Table Alteration

    /**
     Builds an executes an SQL query to alter the name of the old table to the name in the new version of the table.
     ### Usage Example: ###
     In this example, a `Migration` instance is initialized.
     The alterTableName function is called to initiate the SQL query, which changes the name.
     The "responseHandler" is a closure which handles the response from the database.
     ```swift
     let migration = Migration(from: oldTable, to: newTable, using: connection)
     migration.alterTableName(responseHandler)
     ```
    
     - Parameter onCompletion: The function to be called when the execution of the query has completed.
    */
    public func alterTableName(onCompletion: @escaping ((QueryResult) -> ())) {
        let query = "ALTER TABLE " + Utils.packName(table1._name, queryBuilder: connection.queryBuilder) + " RENAME TO " + Utils.packName(table2._name, queryBuilder: connection.queryBuilder)
        renamed = true
        connection.execute(query, onCompletion: onCompletion)
    }

    /**
     Create and execute an SQL query to add a `Column` to the new table in the `Migration` instance.
     ### Usage Example: ###
     In this example, `Migration` and `Column` instances are initialized.
     The `alterTableAdd` function is called to add a new column to `newTable` within the `Migration` instance and a closure `responseHandler` is passed in to handle the response from the database.
     ```swift
     let migration = Migration(from: oldTable, to: newTable, using: connection)
     let toDo_title = Column("toDo_title", String.self, notNull: true)
     migration.alterTableAdd(column: toDo_title, onCompletion: responseHandler)
     ```
    
     - Parameter column: The column to add. This should be a column in the new version of the table.
     - Parameter onCompletion: The function to be called when the execution of the query has completed.
    */
    public func alterTableAdd(column: Column, onCompletion: @escaping ((QueryResult) -> ())) {
        let tableName = renamed ? table2._name : table1._name
        do {
            let query = try "ALTER TABLE " + Utils.packName(tableName, queryBuilder: connection.queryBuilder) + " ADD COLUMN " + column.create(queryBuilder: connection.queryBuilder)
            connection.execute(query, onCompletion: onCompletion)
        }
        catch {
            onCompletion(.error(QueryError.syntaxError("Failed to alter table: \(error)")))
        }
    }
}
