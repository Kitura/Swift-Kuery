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
class TestQueryResult: XCTestCase {
    
    static var allTests: [(String, (TestQueryResult) -> () throws -> Void)] {
        return [
            ("testQueryResult", testQueryResult),
        ]
    }
    
    class MyTable : Table {
        let a = Column("fruit")
        let b = Column("number")
        let c = Column("fruit")
        
        let tableName = "table"
    }
    
    func testQueryResult () {
        let t = MyTable()
        let query = Select(from: t)

        var connection = createConnection(.returnEmpty)
        connection.execute(query: query) { queryResult in
            XCTAssertTrue(queryResult.success, "Query result should be \"success\"")
            XCTAssertNil(queryResult.asResultSet, "Query result should be empty")
            XCTAssertNil(queryResult.asRows, "Query result should be empty")
            XCTAssertNil(queryResult.asValue, "Query result should be empty")
            XCTAssertNil(queryResult.asError, "Query result should be empty")
        }
        
        connection = createConnection(.returnError)
        connection.execute(query: query) { queryResult in
            XCTAssertNotNil(queryResult.asError, "Query result should be error")
            XCTAssertFalse(queryResult.success, "Query result should be error")
            XCTAssertNil(queryResult.asResultSet, "Query result should be error")
            XCTAssertNil(queryResult.asRows, "Query result should be error")
            XCTAssertNil(queryResult.asValue, "Query result should be error")
        }
        
        connection = createConnection(.returnValue)
        connection.execute(query: query) { queryResult in
            XCTAssertTrue(queryResult.success, "Query result should be \"success\"")
            XCTAssertNil(queryResult.asResultSet, "Query result should be a value")
            XCTAssertNil(queryResult.asRows, "Query result should be a value")
            XCTAssertNotNil(queryResult.asValue, "Query result should be a value")
            XCTAssertEqual(queryResult.asValue! as! Int, 5, "Query result should be 5")
            XCTAssertNil(queryResult.asError, "Query result should be  a value")
        }
        
        connection = createConnection(.returnOneRow)
        connection.execute(query: query) { queryResult in
            XCTAssertNil(queryResult.asError, "Query result should be one row")
            XCTAssertTrue(queryResult.success, "Query result should be one row")
            XCTAssertNotNil(queryResult.asResultSet, "Query result should be one row")
            let resultSet = queryResult.asResultSet!
            let titles = resultSet.titles
            XCTAssertEqual(titles, ["fruit", "number", "fruit"])
            let rows = resultSet.rows
            for (index, row) in rows.enumerated() {
                XCTAssertEqual(index, 0, "Query should return only one row")
                XCTAssertEqual(row[0]! as! String, "banana", "Query returned wrong data")
                XCTAssertEqual(row[1]! as! Int, 38, "Query returned wrong data")
                XCTAssertEqual(row[2]! as! String, "apple", "Query returned wrong data")
            }
            XCTAssertNotNil(queryResult.asRows, "Query result should be one row")
            XCTAssertNil(queryResult.asValue, "Query result should be one row")
        }
        connection.execute(query: query) { queryResult in
            let rows = queryResult.asRows
            XCTAssertNotNil(rows, "Query result should be one row")
            XCTAssertEqual(rows?.count, 1, "Wrong number of rows")
            XCTAssertEqual(rows![0]["fruit"] as! String, "banana", "Query returned wrong data")
            XCTAssertEqual(rows![0]["number"] as! Int, 38, "Query returned wrong data")
            XCTAssertEqual(rows![0]["fruit.1"] as! String, "apple", "Query returned wrong data")
        }

        connection = createConnection(.returnThreeRows)
        connection.execute(query: query) { queryResult in
            XCTAssertNil(queryResult.asError, "Query result should be three rows")
            XCTAssertTrue(queryResult.success, "Query result should be three rows")
            XCTAssertNotNil(queryResult.asResultSet, "Query result should be three rows")
            let resultSet = queryResult.asResultSet!
            let titles = resultSet.titles
            XCTAssertEqual(titles, ["fruit", "number", "fruit"])
            let rows = resultSet.rows
            for (index, row) in rows.enumerated() {
                XCTAssertTrue(index < 3, "Query should return only one row")
                if index == 0 {
                    XCTAssertEqual(row[0]! as! String, "banana", "Query returned wrong data")
                    XCTAssertEqual(row[1]! as! Int, 38, "Query returned wrong data")
                    XCTAssertEqual(row[2]! as! String, "apple", "Query returned wrong data")
                }
                else if index == 1 {
                    XCTAssertEqual(row[0]! as! String, "apple", "Query returned wrong data")
                    XCTAssertEqual(row[1]! as! Int, -8, "Query returned wrong data")
                    XCTAssertEqual(row[2]! as! String, "peach", "Query returned wrong data")
                }
                else if index == 2 {
                    XCTAssertEqual(row[0]! as! String, "plum", "Query returned wrong data")
                    XCTAssertEqual(row[1]! as! Int, 7, "Query returned wrong data")
                    XCTAssertEqual(row[2]! as! String, "plum", "Query returned wrong data")
                }
            }
            XCTAssertNotNil(queryResult.asRows, "Query result should be one row")
            XCTAssertNil(queryResult.asValue, "Query result should be one row")
        }
        connection.execute(query: query) { queryResult in
            XCTAssertNotNil(queryResult.asResultSet, "Query result should be three rows")
            let resultSet = queryResult.asResultSet!
            resultSet.nextRow { row in
                XCTAssertNotNil(row, "Failed to fetch next row")
                XCTAssertEqual(row![0]! as! String, "banana", "Query returned wrong data")
                XCTAssertEqual(row![1]! as! Int, 38, "Query returned wrong data")
                XCTAssertEqual(row![2]! as! String, "apple", "Query returned wrong data")
            }
        }
        connection.execute(query: query) { queryResult in
            let rows = queryResult.asRows
            XCTAssertNotNil(rows, "Query result should be three rows")
            XCTAssertEqual(rows?.count, 3, "Wrong number of rows")
            XCTAssertEqual(rows![0]["fruit"] as! String, "banana", "Query returned wrong data")
            XCTAssertEqual(rows![0]["number"] as! Int, 38, "Query returned wrong data")
            XCTAssertEqual(rows![0]["fruit.1"] as! String, "apple", "Query returned wrong data")
            XCTAssertEqual(rows![1]["fruit"] as! String, "apple", "Query returned wrong data")
            XCTAssertEqual(rows![1]["number"] as! Int, -8, "Query returned wrong data")
            XCTAssertEqual(rows![1]["fruit.1"] as! String, "peach", "Query returned wrong data")
            XCTAssertEqual(rows![2]["fruit"] as! String, "plum", "Query returned wrong data")
            XCTAssertEqual(rows![2]["number"] as! Int, 7, "Query returned wrong data")
            XCTAssertEqual(rows![2]["fruit.1"] as! String, "plum", "Query returned wrong data")
        }
    }
}
