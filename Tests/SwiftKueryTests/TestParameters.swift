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

class TestParameters: XCTestCase {
    
    static var allTests: [(String, (TestParameters) -> () throws -> Void)] {
        return [
            ("testParameters", testParameters),
        ]
    }

    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let name = "tableParameters"
    }
    
    func testParameters() {
        let t = MyTable()
        let connection = createConnection()
        
        let i = Insert(into: t, rows: [[Parameter(), 10], ["apricot", Parameter()], [Parameter(), Parameter()]])
        var kuery = connection.descriptionOf(query: i)
        var query = "INSERT INTO tableParameters VALUES (?1, 10), ('apricot', ?2), (?3, ?4)"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")

        var u = Update(t, set: [(t.a, Parameter()), (t.b, Parameter())], where: t.a == "banana")
        kuery = connection.descriptionOf(query: u)
        query = "UPDATE tableParameters SET a = ?1, b = ?2 WHERE tableParameters.a = 'banana'"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
        
        u = Update(t, set: [(t.a, Parameter("name")), (t.b, Parameter())], where: t.a == "banana")
        kuery = connection.descriptionOf(query: u)
        query = "UPDATE tableParameters SET a = @name, b = ?1 WHERE tableParameters.a = 'banana'"
        XCTAssertEqual(kuery, query, "Error in query construction: \(kuery) \ninstead of \(query)")
    }
}
