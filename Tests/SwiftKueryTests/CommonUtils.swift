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

class TestConnection: Connection {
    let queryBuilder: QueryBuilder
    let result: Result

    enum Result {
        case returnEmpty
        case returnOneRow
        case returnThreeRows
        case returnError
        case returnValue
    }

    init(result: Result, withDeleteRequiresUsing: Bool = false, withUpdateRequiresFrom: Bool = false, createAutoIncrement: ((String) -> String)? = nil) {
        self.queryBuilder = QueryBuilder(withDeleteRequiresUsing: withDeleteRequiresUsing, withUpdateRequiresFrom: withUpdateRequiresFrom, createAutoIncrement: createAutoIncrement)
        self.result = result
    }
    
    func connect(onCompletion: (QueryError?) -> ()) {}
    
    public var isConnected: Bool { return true }
    
    func closeConnection() {}
    
    func execute(query: Query, onCompletion: @escaping ((QueryResult) -> ())) {
        returnResult(onCompletion)
    }
    
    func execute(_ raw: String, onCompletion: @escaping ((QueryResult) -> ())) {
        returnResult(onCompletion)
    }
    
    func execute(query: Query, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        returnResult(onCompletion)
    }
    
    func execute(_ raw: String, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        returnResult(onCompletion)
    }
    
    func execute(query: Query, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {
        returnResult(onCompletion)
    }
    
    func execute(_ raw: String, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ()))  {
        returnResult(onCompletion)
    }

    func descriptionOf(query: Query) -> String {
        do {
            let kuery = try query.build(queryBuilder: queryBuilder)
            return kuery
        }
        catch let error {
            XCTFail("Failed to build query: \(error)")
            return ""
        }
    }
    
    private func returnResult(_ onCompletion: @escaping ((QueryResult) -> ())) {
        switch result {
        case .returnEmpty:
            onCompletion(.successNoData)
        case .returnOneRow:
            onCompletion(.resultSet(ResultSet(TestResultFetcher(numberOfRows: 1))))
        case .returnThreeRows:
            onCompletion(.resultSet(ResultSet(TestResultFetcher(numberOfRows: 3))))
        case .returnError:
            onCompletion(.error(QueryError.noResult("Error in query execution.")))
        case .returnValue:
            onCompletion(.success(5))
        }
    }
    
    func startTransaction(onCompletion: @escaping ((QueryResult) -> ())) {}
    
    func commit(onCompletion: @escaping ((QueryResult) -> ())) {}
    
    func rollback(onCompletion: @escaping ((QueryResult) -> ())) {}
    
    func create(savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {}
    
    func rollback(to savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {}
    
    func release(savepoint: String, onCompletion: @escaping ((QueryResult) -> ())) {}
    
    struct TestPreparedStatement: PreparedStatement {}
    
    func prepareStatement(_ query: Query) throws -> PreparedStatement { return TestPreparedStatement() }
    
    func prepareStatement(_ raw: String) throws -> PreparedStatement { return TestPreparedStatement() }
    
    func execute(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ())) {}
    
    func execute(preparedStatement: PreparedStatement, parameters: [Any?], onCompletion: @escaping ((QueryResult) -> ())) {}
    
    func execute(preparedStatement: PreparedStatement, parameters: [String:Any?], onCompletion: @escaping ((QueryResult) -> ())) {}
    
    func release(preparedStatement: PreparedStatement, onCompletion: @escaping ((QueryResult) -> ())) {}
    
    public func lastInsertID(onCompletion: @escaping ((QueryResult) -> ())) {
        onCompletion(.success(Int32(1)))
    }
}

class TestResultFetcher: ResultFetcher {
    let numberOfRows: Int
    let rows = [["banana", 38, "apple"], ["apple", -8, "peach"], ["plum", 7, "plum"]]
    let titles = ["fruit", "number", "fruit"]
    var fetched = 0
    
    init(numberOfRows: Int) {
        self.numberOfRows = numberOfRows
    }
    
    func fetchNext() -> [Any?]? {
        if fetched < numberOfRows {
            fetched += 1
            return rows[fetched - 1]
        }
        return nil
    }
    
    func fetchNext(callback: ([Any?]?) ->()) {
        callback(fetchNext())
    }
    
    func fetchTitles() -> [String] {
        return titles
    }
}

func createConnection(_ result: TestConnection.Result) -> TestConnection {
    return TestConnection(result: result)
}

func createConnection(withDeleteRequiresUsing: Bool = false, withUpdateRequiresFrom: Bool = false, createAutoIncrement: ((String) -> String)? = nil) -> TestConnection {
    return TestConnection(result: .returnEmpty, withDeleteRequiresUsing: withDeleteRequiresUsing, withUpdateRequiresFrom: withUpdateRequiresFrom, createAutoIncrement: createAutoIncrement)
}

// Dummy class for test framework
class CommonUtils { }
