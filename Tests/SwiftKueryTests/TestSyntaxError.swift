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
class TestSyntaxError: XCTestCase {
    
    static var allTests: [(String, (TestSyntaxError) -> () throws -> Void)] {
        return [
            ("testSyntaxError", testSyntaxError),
        ]
    }
    
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableSelect"
    }
    
    func testSyntaxError() {
        let t = MyTable()
        let connection = createConnection()
        
        var u = Update(t, set: [(t.a, "peach"), (t.b, 2)])
            .where(t.a == "banana")
            .where("a == \"apple\"")
        do {
            let _ = try u.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        }
        catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Multiple where clauses. ")
        }
        catch {
            XCTFail("Other than syntax error.")
        }

        u = Update(t, set: [(t.a, "peach"), (t.b, 2)])
            .where(t.a == "banana")
        do {
            let _ = try u.build(queryBuilder: connection.queryBuilder)
        }
        catch QueryError.syntaxError(let error) {
            XCTFail("Syntax error: \(error).")
        }
        catch {
            XCTFail("Other than syntax error.")
        }
        
        u = Update(t, set: [(t.a, "peach"), (t.b, 2)])
            .where(t.a == "banana")
            .where(t.b == 7)
        do {
            let _ = try u.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        }
        catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Multiple where clauses. ")
        }
        catch {
            XCTFail("Other than syntax error.")
        }

        let d = Delete(from: t)
            .where("a == \"apple\"")
            .where(t.b == "2")
            .where(t.b == 7)
        do {
            let _ = try d.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        }
        catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Multiple where clauses. Multiple where clauses. ")
        }
        catch {
            XCTFail("Other than syntax error.")
        }

        let i = Insert(into: t, columns: [t.a], values: ["plum", 8, 0])
        do {
            let _ = try i.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        }
        catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Values count doesn't match column count. ")
        }
        catch {
            XCTFail("Other than syntax error.")
        }
        
        let i2 = Insert(into: t, columns: [t.a], rows: [["plum", 8, 0], ["apple"], []])
        do {
            let _ = try i2.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        }
        catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Values count in row number 0 doesn't match column count. Values count in row number 2 doesn't match column count. ")
        }
        catch {
            XCTFail("Other than syntax error.")
        }

        let i3 = Insert(into: t, columns: [t.a], Select(t.a, t.b, from: t))
        do {
            let _ = try i3.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        }
        catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Number of columns in Select doesn't match column count. ")
        }
        catch {
            XCTFail("Other than syntax error.")
        }

        var s = Select.distinct(t.a, from: t)
            .limit(to: 2)
            .where(t.a.like("b%"))
            .where(t.b >= 0.76)
            .limit(to: 100)
            .on(t.b == 9)
            .using(t.a, t.b)
        do {
            let _ = try s.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        }
        catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Multiple where clauses. Multiple limits. A using clause is not allowed with an on clause. On clause set for statement that is not join. ")
        }
        catch {
            XCTFail("Other than syntax error.")
        }

        s = Select.distinct(t.a, from: t)
            .order(by: .ASC(t.b), .DESC(t.a))
            .having(sum(t.b) > 3)
            .where(t.a.like("b%"))
            .group(by: t.a)
            .order(by: .ASC(t.b), .DESC(t.a))
            .where(t.b >= 0.76)
            .limit(to: 100)
            .group(by: t.a)
        do {
            let _ = try s.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        }
        catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Multiple order by clauses. Multiple where clauses. Multiple group by clauses. ")
        }
        catch {
            XCTFail("Other than syntax error.")
        }
    }
}
