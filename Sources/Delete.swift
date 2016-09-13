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

public struct Delete: Query {
    
    public var table: String
    private var whereClause: Where?
    
    public var description: String {
        if let whcl = whereClause {
            return "DELETE FROM \(table) WHERE \(whcl.predicate)"
        }
        return "DELETE FROM \(table)"
    }
    
    public func build() -> String {
        return description
    }
    
    public init(table: String) {
        self.table = table
    }
    
    public mutating func filtered(by clause: Where) {
        whereClause = clause
    }
    public func filter(by clause: Where) -> Delete {
        var new = self
        new.filtered(by: clause)
        return new
    }
    
}
