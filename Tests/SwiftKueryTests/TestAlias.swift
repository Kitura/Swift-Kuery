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

class TestAlias: XCTestCase {
    
    static var allTests: [(String, (TestAlias) -> () throws -> Void)] {
        return [
            ("testAlias", testAlias),
        ]
    }
    
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableAlias"
    }
    
    func testAlias() {
        let t = MyTable()
        let connection = createConnection()
        
        var s = Select(t.a.as("\"fruit name\""), t.b.as("number"), from: t)
        var kuery = connection.descriptionOf(query: s)
        var query = "SELECT \"tableAlias.a\" AS \"fruit name\", \"tableAlias.b\" AS \"number\" FROM \"tableAlias\""
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        s = Select(from: t.as("new"))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM \"tableAlias\" AS \"new\""
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        let t2 = t.as("\"t 2\"")
        s = Select(t2.a, from: t2)
        kuery = connection.descriptionOf(query: s)
        query = "SELECT \"t 2\".\"a\" FROM \"tableAlias\" AS \"t 2\""
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
    }
}
