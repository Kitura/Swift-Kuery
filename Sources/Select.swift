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

public struct Select : Query {
    public let fields: [Field]?
    public private (set) var whereClause: Filter?
    public private (set) var rawWhereClause: String?
    public private (set) var distinct = false
    public private (set) var top: Int?
    public private (set) var orderBy: [OrderBy]?
    public private (set) var groupBy: [Field]?
    public private (set) var havingClause: Having?
    public private (set) var rawHavingClause: String?
    public private (set) var join: Join?
    public private (set) var onClause: Filter?
    public private (set) var using: [Column]?
    
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
        
        if let join = join {
            result += join.build(queryBuilder: queryBuilder)
        }
        
        if let onClause = onClause {
            result += " ON " + onClause.build(queryBuilder: queryBuilder)
        }
        else if let using = using {
            result += " USING (" + using.map { $0.name }.joined(separator: ", ")
            result += ")"
        }
        
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
    
    public func using(_ columns: Column...) -> Select {
        var new = self
        new.using = columns
        return new
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
    public func `where`(_ conditions: Filter) -> Select {
        var new = self
        new.whereClause = conditions
        return new
    }
    
    public func `where`(_ raw: String) -> Select {
        var new = self
        new.rawWhereClause = raw
        return new
    }
    
    public func on(_ conditions: Filter) -> Select {
        var new = self
        new.onClause = conditions
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
    
    public func join(_ table: Table) -> Select {
        var new = self
        new.join = .join(table)
        return new
    }
    
    public func leftJoin(_ table: Table) -> Select {
        var new = self
        new.join = .left(table)
        return new
    }
    
    public func rightJoin(_ table: Table) -> Select {
        var new = self
        new.join = .right(table)
        return new
    }
    
    public func fullJoin(_ table: Table) -> Select {
        var new = self
        new.join = .full(table)
        return new
    }
    
    public func crossJoin(_ table: Table) -> Select {
        var new = self
        new.join = .cross(table)
        return new
    }
    
    public func naturalJoin(_ table: Table) -> Select {
        var new = self
        new.join = .natural(table)
        return new
    }

    public func naturalLeftJoin(_ table: Table) -> Select {
        var new = self
        new.join = .naturalLeft(table)
        return new
    }

    public func naturalRightJoin(_ table: Table) -> Select {
        var new = self
        new.join = .naturalRight(table)
        return new
    }

    public func naturalFullJoin(_ table: Table) -> Select {
        var new = self
        new.join = .naturalFull(table)
        return new
    }


}

