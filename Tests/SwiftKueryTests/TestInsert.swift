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

class TestInsert: XCTestCase {
    
    static var allTests: [(String, (TestInsert) -> () throws -> Void)] {
        return [
            ("testInsert", testInsert),
            ("testInsertWith", testInsertWith),
            ("testInsertNilValue", testInsertNilValue),
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
        var query = "INSERT INTO \"tableInsert\" VALUES ('apple', 10)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        i = Insert(into: t, optionalValues: ["apple", 10])
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" VALUES ('apple', 10)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        i = Insert(into: t, valueTuples: (t.a, "apricot"), (t.b, "3"))
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" (\"a\", \"b\") VALUES ('apricot', '3')"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        i = Insert(into: t, columns: [t.a, t.b], values: ["banana", 17])
            .suffix("RETURNING *")
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" (\"a\", \"b\") VALUES ('banana', 17) RETURNING *"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        let optionalString: String? = nil
        i = Insert(into: t, columns: [t.a, t.b], values: ["banana", optionalString])
            .suffix("RETURNING *")
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" (\"a\", \"b\") VALUES ('banana', NULL) RETURNING *"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        i = Insert(into: t, rows: [["apple", 17], ["banana", -7], ["banana", 27]])
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" VALUES ('apple', 17), ('banana', -7), ('banana', 27)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        let t2 = MyTable2()
        i = Insert(into: t, columns: [t.a], Select(t2.a, from: t2))
            .suffix("RETURNING a")
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" (\"a\") SELECT \"tableInsert2\".\"a\" FROM \"tableInsert2\" RETURNING a"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
    }
    
    func testInsertWith() {
        let t = MyTable()
        let t2 = MyTable2()
        let connection = createConnection()
        
        class AuxTable: AuxiliaryTable {
            let tableName = "aux_table"
            
            let c = Column("c")
        }
        
        var withTable = AuxTable(as: Select(t2.a.as("c"), from: t2))
        var insertSelect = Select(withTable.c, from: withTable)
        var i = with(withTable,
                     Insert(into: t, columns: [t.a], insertSelect))
        let kuery = connection.descriptionOf(query: i)
        let query = "WITH \"aux_table\" AS (SELECT \"tableInsert2\".\"a\" AS \"c\" FROM \"tableInsert2\") INSERT INTO \"tableInsert\" (\"a\") SELECT \"aux_table\".\"c\" FROM \"aux_table\""
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
        
        withTable = AuxTable()
        insertSelect = Select(withTable.c, from: withTable)
        i = with(withTable,
                     Insert(into: t, columns: [t.a], insertSelect))
        do {
            let _ = try i.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        } catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "With query was not specified. ")
        } catch {
            XCTFail("Other than syntax error.")
        }
        
        i = with(withTable, i)
        do {
            let _ = try i.build(queryBuilder: connection.queryBuilder)
            XCTFail("No syntax error.")
        } catch QueryError.syntaxError(let error) {
            XCTAssertEqual(error, "Multiple with clauses. ")
        } catch {
            XCTFail("Other than syntax error.")
        }
    }

    func testInsertNilValue() {
        let t = MyTable()
        let connection = createConnection()

        let optionalString: String? = nil
        let optionalInt: Int? = nil
        var i = Insert(into: t, values: optionalString, optionalInt)
        var kuery = connection.descriptionOf(query: i)
        var query = "INSERT INTO \"tableInsert\" VALUES (NULL, NULL)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        #if swift(>=4.1.0)
        i = Insert(into: t, values: [optionalString, optionalInt])
        #else
        i = Insert(into: t, optionalValues: [optionalString, optionalInt])
        #endif
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" VALUES (NULL, NULL)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        i = Insert(into: t, valueTuples: (t.a, optionalString), (t.b, optionalInt))
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" (\"a\", \"b\") VALUES (NULL, NULL)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        i = Insert(into: t, columns: [t.a, t.b], values: [optionalString, optionalInt])
            .suffix("RETURNING *")
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" (\"a\", \"b\") VALUES (NULL, NULL) RETURNING *"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")

        i = Insert(into: t, rows: [[optionalString, optionalInt], [optionalString, optionalInt], [optionalString, optionalInt]])
        kuery = connection.descriptionOf(query: i)
        query = "INSERT INTO \"tableInsert\" VALUES (NULL, NULL), (NULL, NULL), (NULL, NULL)"
        XCTAssertEqual(kuery, query, "\nError in query construction: \n\(kuery) \ninstead of \n\(query)")
    }
}
