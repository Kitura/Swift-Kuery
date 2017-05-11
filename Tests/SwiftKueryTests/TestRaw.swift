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

import XCTest

@testable import SwiftKuery
class TestRaw: XCTestCase {
    
    static var allTests: [(String, (TestRaw) -> () throws -> Void)] {
        return [
            ("testRaw", testRaw),
        ]
    }
    
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableRaw"
    }
    
    func testRaw () {
        let t = MyTable()
        let connection = createConnection()
        
        var r = Raw(query: "DROP TABLE", table: t)
        var kuery = connection.descriptionOf(query: r)
        var query = "DROP TABLE tableRaw"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        r = Raw(query: "DROP TABLE", tables: [t])
        kuery = connection.descriptionOf(query: r)
        query = "DROP TABLE tableRaw"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
    }
}
