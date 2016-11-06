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
class TestUpdate: XCTestCase {
    
    static var allTests: [(String, (TestUpdate) -> () throws -> Void)] {
        return [
            ("testUpdateAndDelete", testUpdateAndDelete),
        ]
    }
    
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let name = "tableUpdate"
    }
    
    func testUpdateAndDelete () {
        let t = MyTable()
        let connection = createConnection()
        
        let u = Update(t, set: [(t.a, "peach"), (t.b, 2)])
            .where(t.a == "banana")
        var kuery = connection.descriptionOf(query: u)
        var query = "UPDATE tableUpdate SET a = 'peach', b = 2 WHERE tableUpdate.a = 'banana'"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
 
        var d = Delete(from: t)
            .where(t.b == "2")
        kuery = connection.descriptionOf(query: d)
        query = "DELETE FROM tableUpdate WHERE tableUpdate.b = '2'"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")

        d = Delete(from: t)
        kuery = connection.descriptionOf(query: d)
        query = "DELETE FROM tableUpdate"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
    }
}
