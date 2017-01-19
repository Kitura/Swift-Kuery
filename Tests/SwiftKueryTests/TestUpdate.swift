/**
 Copyright IBM Corporation 2016, 2017
 
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
        
        let tableName = "tableUpdate"
    }
    
    func testUpdateAndDelete () {
        let t = MyTable()
        let connection = createConnection()
        
        var u = Update(t, set: [(t.a, "peach"), (t.b, 2)])
            .where(t.a == "banana")
        var kuery = connection.descriptionOf(query: u)
        var query = "UPDATE tableUpdate SET a = 'peach', b = 2 WHERE tableUpdate.a = 'banana'"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
 
        u = Update(t, set: [(t.a, "peach"), (t.b, 2)])
            .where(t.a == "banana")
            .suffix("RETURNING *")
        kuery = connection.descriptionOf(query: u)
        query = "UPDATE tableUpdate SET a = 'peach', b = 2 WHERE tableUpdate.a = 'banana' RETURNING *"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
 
        u = Update(t, set: [(t.a, "peach"), (t.b, 2)])
            .suffix("RETURNING b,a")
        kuery = connection.descriptionOf(query: u)
        query = "UPDATE tableUpdate SET a = 'peach', b = 2 RETURNING b,a"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        u = Update(t, set: [(t.a, "peach"), (t.b, 2)])
            .suffix("RETURNING tableUpdate.b")
        kuery = connection.descriptionOf(query: u)
        query = "UPDATE tableUpdate SET a = 'peach', b = 2 RETURNING tableUpdate.b"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        var d = Delete(from: t)
            .where(t.b == "2" && t.a.isNull())
        kuery = connection.descriptionOf(query: d)
        query = "DELETE FROM tableUpdate WHERE (tableUpdate.b = '2') AND (tableUpdate.a IS NULL)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        d = Delete(from: t)
        kuery = connection.descriptionOf(query: d)
        query = "DELETE FROM tableUpdate"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
    }
}
