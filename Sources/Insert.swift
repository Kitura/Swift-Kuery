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

public struct Insert : Query {
    public var columns : [Field]?
    public var values : [ValueType]
    
    public let table: String
    
    public init(into table: String, values: ValueType...) {
        self.values = values
        self.table = table
    }
    
    public init(into table: String, columns: [Field], values: [ValueType]) {
        self.values = values
        self.columns = columns
        self.table = table
    }
    
    public init(into table: String, valueTuples: (Field, ValueType)...) {
        columns = Array<Field>()
        values = Array<ValueType>()
        for (column, value) in valueTuples {
            columns!.append(column)
            values.append(value)
        }
        self.table = table
    }
    
    public var description : String {
        var result =  "INSERT INTO \(table) "
        if let columns = columns, columns.count != 0 {
                result += "( \(columns.map { $0.description }.joined(separator: ", ")) )"
        }
        result += "VALUES ( \(values.map { packType($0) }.joined(separator: ", ")) )"
        
        return result
    }
    public func build() -> String {
        return self.description
    }
}
