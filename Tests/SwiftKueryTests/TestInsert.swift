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

class TestInsert: XCTestCase {
    
    static var allTests: [(String, (TestInsert) -> () throws -> Void)] {
        return [
            ("testInsert", testInsert),
        ]
    }
        
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableInsert"
    }

    class MyTable2 : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableInsert2"
    }

    func testInsert() {
        let t = MyTable()
        let connection = createConnection()
            
        var i = Insert(into: t, values: "apple", 10)
        var kuery = connection.descriptionOf(query: i)
        var query = "INSERT INTO tableInsert VALUES ('apple', 10)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        i = Insert(into: t, values: ["apple", 10])
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO tableInsert VALUES ('apple', 10)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        i = Insert(into: t, valueTuples: (t.a, "apricot"), (t.b, "3"))
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO tableInsert (a, b) VALUES ('apricot', '3')"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        i = Insert(into: t, columns: [t.a, t.b], values: ["banana", 17])
            .suffix("RETURNING *")
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO tableInsert (a, b) VALUES ('banana', 17) RETURNING *"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        i = Insert(into: t, rows: [["apple", 17], ["banana", -7], ["banana", 27]])
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO tableInsert VALUES ('apple', 17), ('banana', -7), ('banana', 27)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        let t2 = MyTable2()
        i = Insert(into: t, columns: [t.a], Select(t2.a, from: t2))
            .suffix("RETURNING a")
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO tableInsert (a) SELECT tableInsert2.a FROM tableInsert2 RETURNING a"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
    }
}
