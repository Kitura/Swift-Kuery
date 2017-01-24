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
            ("testUpdateAndDeleteWith", testUpdateAndDeleteWith),
        ]
    }
    
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableUpdate"
    }
    
    class MyTable2 : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableUpdate2"
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
    
    func testUpdateAndDeleteWith() {
        let t = MyTable()
        let t2 = MyTable2()
        let connection = createConnection()
        let psqlConnection = createConnection(type: .postgreSQL)

        class AuxTable: AuxiliaryTable {
            let tableName = "aux_table"
            
            let c = Column("c")
        }

        var withTable = AuxTable(as: Select(t2.a.as("c"), from: t2))
        var u = with(withTable,
                     Update(t, set: [(t.a, "peach"), (t.b, 2)])
                        .where(t.a == withTable.c))
        var kuery = connection.descriptionOf(query: u)
        var query = "WITH aux_table AS (SELECT tableUpdate2.a AS c FROM tableUpdate2) UPDATE tableUpdate SET a = 'peach', b = 2 WHERE tableUpdate.a = aux_table.c"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        kuery = psqlConnection.descriptionOf(query: u)
        query = "WITH aux_table AS (SELECT tableUpdate2.a AS c FROM tableUpdate2) UPDATE tableUpdate SET a = 'peach', b = 2 FROM aux_table WHERE tableUpdate.a = aux_table.c"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        
        var d = with(withTable,
                     Delete(from: t)
                        .where(t.b == withTable.c))
        kuery = connection.descriptionOf(query: d)
        query = "WITH aux_table AS (SELECT tableUpdate2.a AS c FROM tableUpdate2) DELETE FROM tableUpdate WHERE tableUpdate.b = aux_table.c"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        kuery = psqlConnection.descriptionOf(query: d)
        query = "WITH aux_table AS (SELECT tableUpdate2.a AS c FROM tableUpdate2) DELETE FROM tableUpdate USING aux_table WHERE tableUpdate.b = aux_table.c"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        withTable = AuxTable()
        u = with(withTable,
                     Update(t, set: [(t.a, "peach"), (t.b, 2)])
                        .where(t.a == withTable.c))
        do {
            let _ = try u.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        } catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "With query was not specified. ")
        } catch {
            XCTFail("Other than syntax error.")
        }
        
        d = with(withTable,
                 Delete(from: t)
                    .where(t.b == withTable.c))
        do {
            let _ = try u.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        } catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "With query was not specified. ")
        } catch {
            XCTFail("Other than syntax error.")
        }
        
        u = with(withTable, u)
        do {
            let _ = try u.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        } catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Multiple with clauses. ")
        } catch {
            XCTFail("Other than syntax error.")
        }
        
        d = with(withTable, d)
        do {
            let _ = try d.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        } catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Multiple with clauses. ")
        } catch {
            XCTFail("Other than syntax error.")
        }
    }
}
