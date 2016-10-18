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
    public let fields: [Field]?
    public private (set) var whereClause: Where?
    public private (set) var rawWhereClause: String?
    public private (set) var distinct = false
    public private (set) var top: Int?
    public private (set) var orderBy: [OrderBy]?
    public private (set) var groupBy: [Field]?
    public private (set) var havingClause: Having?
    public private (set) var rawHavingClause: String?
    
    public let table: Table
    
    public init(_ fields: Field..., from table: Table) {
        self.fields = fields
        self.table = table
    }
    
    public init(fields: [Field], from table: Table) {
        self.fields = fields
        self.table = table
    }
    
    public func build(queryBuilder: QueryBuilder) -> String {
        var result =  "SELECT "
        if distinct {
            result += "DISTINCT "
        }
        
        if let fields = fields, fields.count != 0 {
            result += "\(fields.map { $0.build(queryBuilder: queryBuilder) }.joined(separator: ", "))"
        }
        else {
            result += "*"
        }
        
        result += " FROM " + table.build(queryBuilder: queryBuilder)
        
        if let whereClause = whereClause {
            result += " WHERE " + whereClause.build(queryBuilder: queryBuilder)
        }
        else if let rawWhereClause = rawWhereClause {
            result += " WHERE " + rawWhereClause
        }
        
        if let groupClause = groupBy {
            result += " GROUP BY " + groupClause.map { $0.build(queryBuilder: queryBuilder) }.joined(separator: ", ")
        }
        
        if let havingClause = havingClause {
            result += " HAVING " + havingClause.build(queryBuilder: queryBuilder)
        }
        else if let rawHavingClause = rawHavingClause {
            result += " HAVING " + rawHavingClause
        }
        
        if let orderClause = orderBy {
            result += " ORDER BY " + orderClause.map { $0.build(queryBuilder: queryBuilder) }.joined(separator: ", ")
        }
        
        if let top = top {
            result += " LIMIT \(top)"
        }
        return result
    }
    
    public func having(_ clause: Having) -> Select {
        var new = self
        new.havingClause = clause
        return new
    }
    
    public func having(_ raw: String) -> Select {
        var new = self
        new.rawHavingClause = raw
        return new
    }
    
    public func order(by clause: OrderBy...) -> Select {
        var new = self
        new.orderBy = clause
        return new
    }
    
    public func group(by clause: Field...) -> Select {
        var new = self
        new.groupBy = clause
        return new
    }
    
    public func limit(to newLimit: Int) -> Select {
        var new = self
        new.top = newLimit
        return new
    }
    
    // Check that only one where clause is set?
    public func `where`(_ conditions: Where) -> Select {
        var new = self
        new.whereClause = conditions
        return new
    }
    
    public func `where`(_ raw: String) -> Select {
        var new = self
        new.rawWhereClause = raw
        return new
    }
    
    public static func distinct(_ fields: Field..., from table: Table) -> Select {
        var selectQuery = Select(fields: fields, from: table)
        selectQuery.distinct = true
        return selectQuery
    }
    
    public static func distinct(fields: [Field], from table: Table)  -> Select {
        var selectQuery = Select(fields: fields, from: table)
        selectQuery.distinct = true
        return selectQuery
    }
    
    
    //    public mutating   having(_ clause: Having) {
    //        havingClause = clause
    //    }
    //
    //    public mutating func order(by clause: OrderBy...) {
    //        orderBy = clause
    //    }
    //
    //    public mutating func group(by clause: Field...) {
    //        groupBy = clause
    //    }
    //
    //    public mutating func limit(to newLimit: Int) {
    //        top = newLimit
    //    }
    //
    //    public mutating func `where`(_ conditions: Where) {
    //        whereClause = conditions
    //    }
    //
}

