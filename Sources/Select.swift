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

import Foundation

public struct Select : Query {
    public var fields : [Field]?
    public var whereClause : Where?
    public var distinct = false
    public var top : Int?
    public var orderBy : String?
    public var groupBy : String?
    public var having : Having?
    
    public let table: String
    
    public init(_ fields: Field..., from table: String){
        self.fields = fields
        self.table = table
    }
    
    public init(_ fields: [Field], from table: String){
        self.fields = fields
        self.table = table
    }
    
    public var description : String {
        var result =  "SELECT "
        if let fields = fields, fields.count != 0 {
            result += "\(fields.map { $0.description }.joined(separator: ", "))"
        }
        else {
            result += " *"
        }
        result += " FROM \(table)"
        if let whereClause = whereClause {
            result += " WHERE \(whereClause.predicate)"
        }
        if let groupClause = groupBy {
            result += " GROUP BY \(groupClause)"
        }
        if let orderClause = orderBy {
            result += " ORDER BY \(orderClause)"
        }
        if let havingClause = having {
            result += " HAVING \(havingClause.clause)"
        }
        if let tp = top {
            result += " LIMIT \(tp)"
        }
        return result
    }
    
    public func build() -> String {
        return self.description
    }
    
    private mutating func havingClause(_ clause: Having) {
        having = clause
    }
    
    public func having(_ clause: Having) -> Select {
        var new = self
        new.havingClause(clause)
        return new
    }
    
    private mutating func order(by clause: [Order]) {
        orderBy = clause.map { $0.description }.joined(separator: ", ")
    }
    
    public func ordered(by clause: Order...) -> Select {
        var new = self
        new.order(by: clause)
        return new
    }
    
    private mutating func group(by clause: [Field]) {
        groupBy = clause.map { $0.description }.joined(separator: ", ")
    }
    
    public func grouped(by clause: Field...) -> Select {
        var new = self
        new.group(by: clause)
        return new
    }
    
    private mutating func limit(to newLimit: Int) {
        top = newLimit
    }
    
    public func limited(to newLimit: Int) -> Select {
        var new = self
        new.limit(to: newLimit)
        return new
    }
    
    public mutating func filtered(by conditions: Where) {
        self.whereClause = conditions
    }
    
    public func filter(by conditions: Where) -> Select {
        var new = self
        new.filtered(by: conditions)
        return new
    }
}
