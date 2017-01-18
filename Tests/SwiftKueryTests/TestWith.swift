/**
 Copyright IBM Corporation 2017
 
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
class TestWith: XCTestCase {
    
    static var allTests: [(String, (TestWith) -> () throws -> Void)] {
        return [
            ("testWith", testWith),
        ]
    }
    
    class MyTable : Table {
        let a = Column("a")
        let b = Column("b")
        
        let tableName = "tableSelect"
    }
    
    class MyTable1 : Table {
        let c = Column("c")
        let b = Column("b")
        
        let tableName = "tableSelect1"
    }
    
    func testWith() {
        let t = MyTable()
        let t1 = MyTable1()
        let connection = createConnection()
        
        class AuxTable: WithTable {
            let tableName = "aux_table"
            
            let d = Column("d")
            let f = Column("f")
        }
        
        var withTable = AuxTable(as: Select(t1.c.as("d"), t1.b.as("f"), from: t1))
        
        var s = with(withTable, Select(withTable.d, t.a, from: t).join(withTable))
        let kuery = connection.descriptionOf(query: s)
        let query = "WITH aux_table AS (SELECT tableSelect1.c AS d, tableSelect1.b AS f FROM tableSelect1) SELECT aux_table.d, tableSelect.a FROM tableSelect JOIN aux_table"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        withTable = AuxTable()
        s = with(withTable, Select(withTable.d, t.a, from: t).join(withTable))
        do {
            let _ = try s.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        } catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "With query was not specified. ")
        } catch {
            XCTFail("Other than syntax error.")
        }
    }
}
