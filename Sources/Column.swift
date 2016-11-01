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

public class Column : Field {
    public private (set) var name: String
        
    public var alias: String?
    
    public weak var table: Table!

    public init(_ name: String) {
        self.name = name
    }
    
    public func build(queryBuilder: QueryBuilder) throws -> String {
        var result = table.nameInQuery() + "." + name
        if let alias = alias {
            result += " AS " + alias
        }
        return result
    }
    
    public func `as`(_ newName: String) -> Column {
        let new = Column(name)
        new.alias = newName
        new.table = table
        return new
    }
}

