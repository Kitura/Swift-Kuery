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

// MARK: AuxiliaryTable

/**
 Subclasses of the `AuxiliaryTable` class are describing a `Table` that is used in WITH clauses.
 ### Usage Example: ###
 In this example, a `ToDoTable`, a `PersonTable` and a connection instances are initialized. (Under the assumtion these classes have been defined elsewhere)
 An `AuxiliaryTable` class is defined containing two columns. An instance of this `AuxiliaryTable` is then initialised from `Column` instances in "todotable".
 This `AuxiliaryTable` is then used to create an SQL WITH query.
 A description of the created query is then printed.
 ```swift
 let todotable = ToDoTable()
 let persontable = PersonTable()
 let connection = createConnection()
 class AuxTable: AuxiliaryTable {
    let tableName = "aux_table"
    let name = Column("name")
    let finished = Column("finished")
 }
 let withTable = AuxTable(as: Select(todotable.toDo_completed.as("finished"), todotable.toDo_title.as("name"), from: todotable))
 let withQuery = with(withTable, Select(withTable.finished, persontable.monthlyPay, from: persontable).join(withTable).on(persontable.name == withTable.name))
 let stringQuery = connection.descriptionOf(query: withQuery)
 print(stringQuery)
 // Prints WITH aux_table AS (SELECT todotable.toDo_completed AS finished, todotable.toDo_title AS name FROM todotable) SELECT aux_table.name, persontable.monthlyPay FROM persontable JOIN aux_table ON persontable.name = aux_table.name"
 ```
 */
open class AuxiliaryTable: Table {
    
    /// A query used to build table in WITH clause
    private var query: Query?
    
    /**
     Initialize an instance of `AuxiliaryTable`.
     ### Usage Example: ###
     In this example, a `ToDoTable`, a `PersonTable` and a connection instances are initialized. (Under the assumtion these classes have been defined elsewhere)
     An `AuxiliaryTable` class is defined containing two columns. An instance of this `AuxiliaryTable` is then initialised from the `Column` instances in "todotable".
     ```swift
     let todotable = ToDoTable()
     class AuxTable: AuxiliaryTable {
        let tableName = "aux_table"
        let name = Column("name")
        let finished = Column("finished")
     }
     let withTable = AuxTable(as: Select(todotable.toDo_completed.as("finished"), todotable.toDo_title.as("name"), from: todotable))
     ```
     */
    /// - Parameter query: A query that will be used in WITH clause.
    public convenience init(as query: Query) {
        self.init()
        self.query = query
    }
    
    /**
     Build a String representation of the WITH clause used to create the `AuxiliaryTable` instance, using `QueryBuilder` to account for the various databases.
     ### Usage Example: ###
     In this example, `ToDoTable`, and queryBuilder instances are initialized. (Under the assumtion these classes have been defined elsewhere)
     An `AuxiliaryTable` class is defined containing two columns. An instance of this `AuxiliaryTable` is then initialised from the `Column` instances in "todotable".
     The buildWith function is then called on this `AuxiliaryTable` instance, with the resulting String being printed out.
     ```swift
     let todotable = ToDoTable()
     let queryBuilder = QueryBuilder()
     class AuxTable: AuxiliaryTable {
     let tableName = "aux_table"
        let name = Column("name")
        let finished = Column("finished")
     }
     let withTable = AuxTable(as: Select(todotable.toDo_completed.as("finished"), todotable.toDo_title.as("name"), from: todotable))
     let withString = try withTable.buildWith(queryBuilder: queryBuilder)
     print(withString)
     // Prints aux_table AS (SELECT toDoTable.toDo_completed AS finished, toDoTable.toDo_title AS name FROM toDoTable)
     ```
     */
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func buildWith(queryBuilder: QueryBuilder) throws -> String {
        guard let query = query else {
            throw QueryError.syntaxError("With query was not specified. ")
        }
        return Utils.packName(nameInQuery, queryBuilder: queryBuilder) + " AS " + "(" + (try query.build(queryBuilder: queryBuilder)) + ")"
    }
    
}
