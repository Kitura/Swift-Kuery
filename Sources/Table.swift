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

public protocol Table {
    static var name : String { get }
}

extension Table {
    public static func select(_ fields: Field...) -> Select {
        return Select(fields: fields, from: self.name)
    }
    public static func delete() -> Delete {
        return Delete(table: self.name)
    }
    public static func update(values: [Field: Any], cond: Where) -> Update {
        return Update(values: values, conditions: cond, table: self.name)
    }
    public static func insert(values: [Field: Any]) -> Insert {
        return Insert(into: self.name, columns: [Field](values.keys), values: [Any](values.values))
    }
    public static func truncate() -> Raw {
        return Raw(query: "TRUNCATE \(self.name)")
    }
    public static func drop() -> Raw {
        return Raw(query: "DROP TABLE \(self.name)")
    }
}
