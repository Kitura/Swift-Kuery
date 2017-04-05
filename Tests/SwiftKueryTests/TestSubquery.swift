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
class TestSubquery: XCTestCase {
    
    static var allTests: [(String, (TestSubquery) -> () throws -> Void)] {
        return [
            ("testSubquery", testSubquery),
            ("testLinuxTestSuiteIncludesAllTests", testLinuxTestSuiteIncludesAllTests)
        ]
    }
    
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableSubquery"
    }
    
    func testSubquery() {
        let t = MyTable()
        let connection = createConnection()
        
        var s = Select(from: t)
            .where(t.b == any(Select(t.b, from: t).where(t.b == 2)))
        var kuery = connection.descriptionOf(query: s)
        var query = "SELECT * FROM tableSubquery WHERE tableSubquery.b = ANY (SELECT tableSubquery.b FROM tableSubquery WHERE tableSubquery.b = 2)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        s = Select(t.a, from: t)
            .group(by: t.a)
            .having(sum(t.b) == any(Select(t.b, from: t).where(t.b == 2)))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT tableSubquery.a FROM tableSubquery GROUP BY tableSubquery.a HAVING SUM(tableSubquery.b) = ANY (SELECT tableSubquery.b FROM tableSubquery WHERE tableSubquery.b = 2)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        s = Select(from: t)
            .where(exists(Select(t.b, from: t).where(t.b == 2)))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery WHERE EXISTS (SELECT tableSubquery.b FROM tableSubquery WHERE tableSubquery.b = 2)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        s = Select(from: t)
            .where(8.in(1,6,8))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery WHERE 8 IN (1, 6, 8)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        s = Select(from: t)
            .group(by: t.a)
            .having("apple".in("plum"))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery GROUP BY tableSubquery.a HAVING 'apple' IN ('plum')"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        s = Select(from: t)
            .where(8.in(Select(t.b, from: t).where(t.b == 8)))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery WHERE 8 IN (SELECT tableSubquery.b FROM tableSubquery WHERE tableSubquery.b = 8)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        s = Select(from: t)
            .group(by: t.a)
            .having(exists(Select(t.b, from: t).where(t.b == 8)))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery GROUP BY tableSubquery.a HAVING EXISTS (SELECT tableSubquery.b FROM tableSubquery WHERE tableSubquery.b = 8)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        s = Select(from: t)
            .group(by: t.a)
            .having(notExists(Select(t.b, from: t).where(t.b == 8)) && sum(t.b) > 0)
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery GROUP BY tableSubquery.a HAVING (NOT EXISTS (SELECT tableSubquery.b FROM tableSubquery WHERE tableSubquery.b = 8)) AND (SUM(tableSubquery.b) > 0)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        s = Select(from: t)
            .where(notExists(Select(t.b, from: t).where(t.b == 8)))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery WHERE NOT EXISTS (SELECT tableSubquery.b FROM tableSubquery WHERE tableSubquery.b = 8)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        s = Select(from: t)
            .group(by: t.a)
            .having(Parameter().in(Parameter(), Parameter()))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery GROUP BY tableSubquery.a HAVING ?1 IN (?2, ?3)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        s = Select(from: t)
            .where(false.notIn(Parameter(), Parameter()))
        kuery = connection.descriptionOf(query: s)
        query = "SELECT * FROM tableSubquery WHERE false NOT IN (?1, ?2)"
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
