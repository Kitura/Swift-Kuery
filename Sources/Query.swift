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

public enum QueryError: Error {
    case connection
    //...
}
public enum QueryResult {
    case error(Error)
    case rows([[String: ValueType]])
    case success(ValueType)
    //...
    
    public var success: Bool {
        switch self {
        case .error : return false
        default     : return true
        }
    }
    
    public var asRows: [[String: ValueType]]? {
        switch self {
        case .rows(let rows) : return rows
        default              : return nil
        }
    }
    
    public var asError: Error? {
        switch self {
        case .error(let err) : return err
        default              : return nil
        }
    }
}

public protocol Query {
    var table : String { get }
    
    var description : String { get }
    
    func build() -> String
    
}

extension Query {
    
    public func execute(_ connection: Connection, onCompletion: @escaping ((QueryResult) -> ())) {
        connection.execute(query: self, onCompletion: onCompletion)
    }
}
