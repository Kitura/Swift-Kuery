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

#if os(Linux)
public typealias ValueType = Any
#else
public typealias ValueType = Any
#endif

public protocol Connection {
    
    var queryBuilder: QueryBuilder { get }
    
    init(host: String, port: Int32, queryBuilder: QueryBuilder, options: [ConnectionOptions]?)
    func connect(onCompletion: (String?) -> ())
    func closeConnection()
    func execute(query: Query, onCompletion: @escaping ((QueryResult) -> ()))
    func execute(_ raw: String, onCompletion: @escaping ((QueryResult) -> ()))
    func execute(query: Query, parameters: ValueType..., onCompletion: @escaping ((QueryResult) -> ()))
    func descriptionOf(query: Query) -> String
}

public enum ConnectionOptions {
    case options(String)
    case databaseName(String)
    case userName(String)
    case password(String)
    case connectionTimeout(Int)
}

public extension Connection {
    public var queryBuilder: QueryBuilder {
        return self.queryBuilder
    }
}

