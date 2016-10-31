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

public struct Insert : Query {
    public let columns: [Column]?
    public let values: [[Any]]
    public let table: Table
    
   public init(into table: Table, columns: [Column]?, values: [Any]) {
        self.columns = columns
        var valuesToInsert = [[Any]]()
        valuesToInsert.append(values)
        self.values = valuesToInsert
        self.table = table
    }
    
    public init(into table: Table, columns: [Column]?=nil, rows: [[Any]]) {
        self.columns = columns
        self.values = rows
        self.table = table
    }
    
    public init(into table: Table, values: Any...) {
        self.init(into: table, columns: nil, values: values)
    }
    
    public init(into table: Table, valueTuples: [(Column, Any)]) {
        var columnsArray = Array<Column>()
        var valuesArray = Array<Any>()
        for (column, value) in valueTuples {
            columnsArray.append(column)
            valuesArray.append(value)
        }
        self.init(into: table, columns: columnsArray, values: valuesArray)
    }
    
    public init(into table: Table, valueTuples: (Column, Any)...) {
        self.init(into: table, valueTuples: valueTuples)
    }
        
    public func build(queryBuilder: QueryBuilder) -> String {
        var result =  "INSERT INTO " + table.build(queryBuilder: queryBuilder) + " "
        if let columns = columns, columns.count != 0 {
            result += "(\(columns.map { $0.name }.joined(separator: ", "))) "
        }
        result += "VALUES ("
        result += "\(values.map { "\($0.map { packType($0, queryBuilder: queryBuilder) }.joined(separator: ", "))" }.joined(separator: "), ("))"
        result += ")"
        result = updateParameterNumbers(query: result, queryBuilder: queryBuilder)
        return result
    }
}
