/**
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

#if os(Linux)
    import Glibc
#elseif os(OSX)
    import Darwin
#endif

import XCTest
import Foundation

import SwiftKuery

public class TestConnection : Connection {
    public var queryBuilder: QueryBuilder
    
    public required init() {
        self.queryBuilder = QueryBuilder()
    }

    public func connect(onCompletion: (QueryError?) -> ()) {}
    
    public func closeConnection() {}
    
    public func execute(query: Query, onCompletion: @escaping ((QueryResult) -> ())) {}
    
    public func execute(_ raw: String, onCompletion: @escaping ((QueryResult) -> ())) {}
    
    public func execute(query: Query, parameters: [Any], onCompletion: @escaping ((QueryResult) -> ())) {}
    
    public func execute(_ raw: String, parameters: [Any], onCompletion: @escaping ((QueryResult) -> ())) {}
    
    public func descriptionOf(query: Query) -> String {
        do {
            let kuery = try query.build(queryBuilder: queryBuilder)
            return kuery
        }
        catch {
            XCTFail("Failed to build query")
            return ""
        }
    }
    
}


func createConnection() -> TestConnection {
    return TestConnection()
}

// Dummy class for test framework
class CommonUtils { }
