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

// MARK: Insert

/// The SQL INSERT statement.
public struct Insert: Query {
    /// The table to insert rows.
    public let table: Table
    
    /// An array of columns to insert. If not specified, values of all the columns have to be provided.
    public let columns: [Column]?
    
    /// An array of rows (values to insert in each row).
    public private (set) var values: [[Any]]?
    
    /// A String with a clause to be appended to the end of the query.
    public private (set) var suffix: QuerySuffixProtocol?
    
    /// The select query that retrieves the rows to insert (for INSERT INTO SELECT).
    public private (set) var query: Select?
    
    /// An array of `AuxiliaryTable` which will be used in a query with a WITH clause.
    public private (set) var with: [AuxiliaryTable]?
    
    private var syntaxError = ""
    
    /// Initialize an instance of Insert.
    ///
    /// - Parameter into: The table to insert rows.
    /// - Parameter columns: An optional array of columns to insert. If nil, values of all the columns have to be provided.
    /// - Parameter values: An array containg the row to insert.
    public init(into table: Table, columns: [Column]?, values: [Any]) {
        self.columns = columns
        var valuesToInsert = [[Any]]()
        valuesToInsert.append(values)
        self.values = valuesToInsert
        self.table = table
        if let tableColumns = self.columns, tableColumns.count != values.count {
            syntaxError = "Values count doesn't match column count. "
        }
    }
    
    /// Initialize an instance of Insert.
    ///
    /// - Parameter into: The table to insert rows.
    /// - Parameter columns: An optional array of columns to insert. If not specified, values of all the columns have to be provided.
    /// - Parameter values: An array of rows (values to insert in each row).
    public init(into table: Table, columns: [Column]?=nil, rows: [[Any]]) {
        self.columns = columns
        self.values = rows
        self.table = table
        if let tableColumns = self.columns {
            for (index, row) in rows.enumerated() {
                if tableColumns.count != row.count {
                    syntaxError += "Values count in row number \(index) doesn't match column count. "
                }
            }
        }
    }
    
    /// Initialize an instance of Insert.
    ///
    /// - Parameter into: The table to insert rows.
    /// - Parameter values: A list of values (the row) to insert.
    public init(into table: Table, values: Any...) {
        self.init(into: table, columns: nil, values: values)
    }
    
    /// Initialize an instance of Insert.
    ///
    /// - Parameter into: The table to insert rows.
    /// - Parameter values: An array of values (the row) to insert.
    public init(into table: Table, values: [Any]) {
        self.init(into: table, columns: nil, values: values)
    }

    /// Initialize an instance of Insert.
    ///
    /// - Parameter into: The table to insert rows.
    /// - Parameter valueTuples: An array of (column, value) pairs to insert.
    public init(into table: Table, valueTuples: [(Column, Any)]) {
        var columnsArray = Array<Column>()
        var valuesArray = Array<Any>()
        for (column, value) in valueTuples {
            columnsArray.append(column)
            valuesArray.append(value)
        }
        self.init(into: table, columns: columnsArray, values: valuesArray)
    }
    
    /// Initialize an instance of Insert.
    ///
    /// - Parameter into: The table to insert rows.
    /// - Parameter valueTuples: A list of (column, value) pairs to insert.
    public init(into table: Table, valueTuples: (Column, Any)...) {
        self.init(into: table, valueTuples: valueTuples)
    }

    /// Initialize an instance of Insert.
    ///
    /// - Parameter into: The table to insert rows.
    /// - Parameter columns: An optional array of columns to insert. If nil, values of all the columns have to be provided.
    /// - Parameter query: The select query that retrieves the rows to insert.
    public init(into table: Table, columns: [Column]?=nil, _ query: Select) {
        self.columns = columns
        self.table = table
        self.query = query
        if let tableColumns = self.columns, let selectColumns = query.fields,
            tableColumns.count != selectColumns.count {
            syntaxError = "Number of columns in Select doesn't match column count. "
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
        
        var result = ""
        
        if let with = with {
            result += "WITH "
                + "\(try with.map { try $0.buildWith(queryBuilder: queryBuilder) }.joined(separator: ", "))"
                + " "
        }
        
        result += "INSERT INTO "
        
        result += try table.build(queryBuilder: queryBuilder) + " "
        if let columns = columns, columns.count != 0 {
            result += "(\(columns.map { $0.name }.joined(separator: ", "))) "
        }
        if let values = values {
            result += "VALUES ("
            result += try "\(values.map { "\(try $0.map { try Utils.packType($0, queryBuilder: queryBuilder) }.joined(separator: ", "))" }.joined(separator: "), ("))"
            result += ")"
        }
        else if let query = query {
            result += try query.build(queryBuilder: queryBuilder)
        }
        else {
            throw QueryError.syntaxError("Insert query doesn't have any values to insert.")
        }
        if let suffix = suffix {
            result += try " " + suffix.build(queryBuilder: queryBuilder)
        }
        result = Utils.updateParameterNumbers(query: result, queryBuilder: queryBuilder)
        return result
    }
    
    /// Add a raw suffix to the insert statement.
    ///
    /// - Parameter raw: A String with a clause to be appended to the end of the query.
    /// - Returns: A new instance of Insert.
    public func suffix(_ raw: String) -> Insert {
        var new = self
        if suffix != nil {
            new.syntaxError += "Multiple suffixes. "
        }
        else {
            new.suffix = raw
        }
        return new
    }
    
    /// Set tables to be used for WITH clause.
    ///
    /// - Parameter tables: A list of the `AuxiliaryTable` to apply.
    /// - Returns: A new instance of Insert with tables for WITH clause.
    func with(_ tables: [AuxiliaryTable]) -> Insert {
        var new = self
        if new.with != nil {
            new.syntaxError += "Multiple with clauses. "
        }
        else {
            new.with = tables
        }
        return new
    }
}
