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

open class Table  {
    open var name: String {
        return ""
    }
    
    public var alias: String?
    
    public required init() {
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let ch = child.value as? Column {
                ch.table = self
            }
        }
    }
    
    public func build(queryBuilder: QueryBuilder) -> String {
        var result = name
        if let alias = alias {
            result += " AS " + alias
        }
        return result
    }

    public func `as`(_ newName: String) -> Self {
        let new =  type(of: self).init()
        new.alias = newName
        return new
    }
}

public func select(_ fields: Field..., from table: Table) -> Select {
    return Select(fields: fields, from: table)
}

public func delete(from table: Table) -> Delete {
    return Delete(from: table)
}

public func update(table: Table, set: [(Field, Any)], conditions: Where?=nil) -> Update {
    return Update(table: table, set: set, conditions: conditions)
}

public func insert(into table: Table, valueTuples: [(Column, Any)]) -> Insert {
    return Insert(into: table, valueTuples: valueTuples)
}

public func truncate(table: Table) -> Raw {
    return Raw(query: "TRUNCATE TABLE", table: table)
}

public func drop(table: Table) -> Raw {
    return Raw(query: "DROP TABLE", table: table)
}

