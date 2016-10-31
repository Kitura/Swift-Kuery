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

public struct Update : Query {
    public let table: Table
    public private (set) var whereClause: Filter?
    public private (set) var rawWhereClause: String?
    private let valueTuples: [(Column, Any)]
    
    public func build(queryBuilder: QueryBuilder) -> String {
        let values = valueTuples.map {column, value in "\(column.name) = \(packType(value, queryBuilder: queryBuilder))" }.joined(separator: ", ")
        var result = "UPDATE " + table.build(queryBuilder: queryBuilder) + " SET \(values)"
        if let whereClause = whereClause {
            result += " WHERE " + whereClause.build(queryBuilder: queryBuilder)
        }
        else if let rawWhereClause = rawWhereClause {
            result += " WHERE " + rawWhereClause
        }
        result = updateParameterNumbers(query: result, queryBuilder: queryBuilder)
        return result
    }
    
    public init(_ table: Table, set: [(Column, Any)], where conditions: Filter?=nil) {
        self.table = table
        self.valueTuples = set
        self.whereClause = conditions
    }
        
    public func `where`(_ conditions: Filter) -> Update {
        var new = self
        new.whereClause = conditions
        return new
    }

    public func `where`(_ raw: String) -> Update {
        var new = self
        new.rawWhereClause = raw
        return new
    }
}
