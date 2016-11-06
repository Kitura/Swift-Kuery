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
class TestSelect: XCTestCase {
    
    static var allTests: [(String, (TestSelect) -> () throws -> Void)] {
        return [
            ("testSelect", testSelect),
        ]
    }
    
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let name = "tableSelect"
    }
    
    func testSelect() {
        let t = MyTable()
        let connection = createConnection()
        
        var s = Select(from: t)
        var kuery = connection.descriptionOf(query: s)
        var query = "SELECT * FROM tableSelect"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        s = Select.distinct(t.a, from: t)
            .where(t.a.like("b%"))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT DISTINCT tableSelect.a FROM tableSelect WHERE tableSelect.a LIKE 'b%'"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        s = Select(t.b, t.a, from: t)
            .where(((t.a == "banana") || (ucase(t.a) == "APPLE")) && (t.b == 27 || t.b == -7 || t.b == 17))
            .order(by: .ASC(t.b), .DESC(t.a))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT tableSelect.b, tableSelect.a FROM tableSelect WHERE ((tableSelect.a = 'banana') OR (UCASE(tableSelect.a) = 'APPLE')) AND (((tableSelect.b = 27) OR (tableSelect.b = -7)) OR (tableSelect.b = 17)) ORDER BY tableSelect.b ASC, tableSelect.a DESC"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        s = Select(t.a, from: t)
            .where(t.b >= 0)
            .group(by: t.a)
            .order(by: .DESC(t.a))
            .having(sum(t.b) > 3)
        kuery = connection.descriptionOf(query: s)
        query = "SELECT tableSelect.a FROM tableSelect WHERE tableSelect.b >= 0 GROUP BY tableSelect.a HAVING (SUM(tableSelect.b)) > 3 ORDER BY tableSelect.a DESC"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        s = Select(RawField("left(a, 2) as raw"), from: t)
            .where("b >= 0")
            .group(by: t.a)
            .order(by: .DESC(t.a))
            .having("sum(b) > 3")
        kuery = connection.descriptionOf(query: s)
        query = "SELECT left(a, 2) as raw FROM tableSelect WHERE b >= 0 GROUP BY tableSelect.a HAVING sum(b) > 3 ORDER BY tableSelect.a DESC"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        s = Select(t.a, t.b, from: t)
            .limit(to: 2)
            .order(by: .DESC(t.a))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT tableSelect.a, tableSelect.b FROM tableSelect ORDER BY tableSelect.a DESC LIMIT 2"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        s = Select(ucase(t.a).as("case"), t.b, from: t)
            .where(t.a.between("apra", and: "aprt"))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT UCASE(tableSelect.a) AS case, tableSelect.b FROM tableSelect WHERE tableSelect.a BETWEEN 'apra' AND 'aprt'"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        s = Select(from: t)
            .where(t.a.in("apple", "lalala"))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSelect WHERE tableSelect.a IN ('apple', 'lalala')"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        s = Select(from: t)
            .where("a IN ('apple', 'lalala')")
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSelect WHERE a IN ('apple', 'lalala')"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
    }
}
