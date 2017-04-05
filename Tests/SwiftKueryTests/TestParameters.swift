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
            ("testLinuxTestSuiteIncludesAllTests", testLinuxTestSuiteIncludesAllTests)
        ]
    }

    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableParameters"
    }
    
    func testParameters() {
        let t = MyTable()
        let connection = createConnection()
        
        let i = Insert(into: t, rows: [[Parameter(), 10], ["apricot", Parameter()], [Parameter(), Parameter()]])
        var kuery = connection.descriptionOf(query: i)
        var query = "INSERT INTO tableParameters VALUES (?1, 10), ('apricot', ?2), (?3, ?4)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        var u = Update(t, set: [(t.a, Parameter()), (t.b, Parameter())], where: t.a == "banana")
        kuery = connection.descriptionOf(query: u)
        query = "UPDATE tableParameters SET a = ?1, b = ?2 WHERE tableParameters.a = 'banana'"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        u = Update(t, set: [(t.a, Parameter("name")), (t.b, Parameter())], where: t.a == "banana")
        kuery = connection.descriptionOf(query: u)
        query = "UPDATE tableParameters SET a = @name, b = ?1 WHERE tableParameters.a = 'banana'"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        let d = Delete(from: t)
            .where(t.b == Parameter())
        kuery = connection.descriptionOf(query: d)
        query = "DELETE FROM tableParameters WHERE tableParameters.b = ?1"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        var s = Select(t.a, from: t)
            .where(t.b.notBetween(Parameter(), and: Parameter()))
            .group(by: t.a)
            .order(by: .DESC(t.a))
            .having(sum(t.b) < Parameter())
        kuery = connection.descriptionOf(query: s)
        query = "SELECT tableParameters.a FROM tableParameters WHERE tableParameters.b NOT BETWEEN ?1 AND ?2 GROUP BY tableParameters.a HAVING SUM(tableParameters.b) < ?3 ORDER BY tableParameters.a DESC"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        s = Select(t.a, from: t)
            .where(t.a.like(Parameter()))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT tableParameters.a FROM tableParameters WHERE tableParameters.a LIKE ?1"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
    }
    
    func testLinuxTestSuiteIncludesAllTests() {
        #if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
            let thisClass = type(of: self)
            let linuxCount = thisClass.allTests.count
            let darwinCount = Int(thisClass.defaultTestSuite().testCaseCount)
            XCTAssertEqual(linuxCount, darwinCount, "\(darwinCount - linuxCount) tests are missing from allTests")
        #endif
    }
}
