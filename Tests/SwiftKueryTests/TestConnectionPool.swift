//
//  TestConnectionPool.swift
//  SwiftKueryTests
//
//  Created by David Dunn on 27/06/2018.
//

import XCTest

@testable import SwiftKuery

class TestConnectionPool: XCTestCase {
    
    static var allTests: [(String, (TestConnectionPool) -> () throws -> Void)] {
        return [
            ("testGetConnection", testGetConnection)
        ]
    }
    
    func createPool(initialCapacity: Int, maxCapacity: Int, databaseActive: Bool = true) -> ConnectionPool {
        let options = ConnectionPoolOptions(initialCapacity: initialCapacity, maxCapacity: maxCapacity, timeout: 1000)
        let connectionGenerator: () -> Connection? = {
            let connection = createConnection()
            connection.isDatabaseReachable = databaseActive
            if connection.isDatabaseReachable {
                return connection
            } else {
                return nil
            }
        }
        
        let connectionReleaser: (_ connection: Connection) -> () = { connection in
            connection.closeConnection()
        }
        
        return ConnectionPool(options: options, connectionGenerator: connectionGenerator, connectionReleaser: connectionReleaser)
        
    }
    
    func testInitValues() {
        let pool = createPool(initialCapacity: 2, maxCapacity: 5)
        XCTAssertEqual(pool.pool.count , pool.capacity)
    }
    
    func testGetConnection() {
        let pool = createPool(initialCapacity: 2, maxCapacity: 5)
        XCTAssertNotNil(pool.getConnection())
    }
    
    func testConnectionType() {
        let pool = createPool(initialCapacity: 2, maxCapacity: 5)
        let conn = pool.getConnection()
        
        guard let connection = conn else {
            XCTFail("Connection is nil")
            return
        }
        
        XCTAssertEqual(String(reflecting: connection), "SwiftKuery.ConnectionPoolConnection")
    }
    
    func testIncreasingPoolToMaxCapacity() {
        let pool = createPool(initialCapacity: 1, maxCapacity: 3)
        
        let firstConn = pool.getConnection()
        let secondConn = pool.getConnection()
        //Check capacity has been increased
        XCTAssertEqual(pool.capacity, 3)
        
        let thirdConn = pool.getConnection()
        //Check capacity didn't exceed max capacity
        XCTAssertEqual(pool.capacity, 3)
        
        firstConn?.closeConnection()
        secondConn?.closeConnection()
        thirdConn?.closeConnection()
    }
    
    func testZeroCapacity() {
        let pool = createPool(initialCapacity: 0, maxCapacity: 3)
        //Test if capacity is increased during initialisation
        XCTAssertEqual(pool.capacity, 1)
        //Test if pool.count is increased during initialisation
        XCTAssertEqual(pool.pool.count, 1)
    }
    
    func testRecoverFromZeroCapacity() {
        let pool = createPool(initialCapacity: 0, maxCapacity: 3)
        //Take the last connection from the pool
        let result = pool.getConnection()
        
        guard let _ = result else {
            XCTFail("Connection was nil")
            return
        }
        
        //Check that after the last connection was taken from the pool a new connection was added to the pool
        XCTAssertEqual(pool.pool.count, 1)
        //Check that capacity has also been incremented
        XCTAssertEqual(pool.capacity, 2)
    }
    
    func testReturningConnection() {
        let pool = createPool(initialCapacity: 2, maxCapacity: 5)
        
        let conn = pool.getConnection()
        
        guard let connection = conn else {
            XCTFail("Connection is nil")
            return
        }
        
        pool.release(connection: connection)
        
        //Check the pool size has returned to original value
        XCTAssertEqual(pool.pool.count, 2)
    }
    
    func testDeadConnectionNotReturnedToPool() {
        let pool = createPool(initialCapacity: 1, maxCapacity: 1)
        
        let conn = pool.getConnection()
        guard let connection = conn else {
            XCTFail("Connection is nil")
            return
        }
        
        connection.closeConnection()
        pool.release(connection: connection)
        
        let newConn = pool.getConnection()
        
        guard let newConnection = newConn else {
            XCTFail("Connection is nil")
            return
        }
        XCTAssert(newConnection.isConnected)
    }
    
    func testDatabaseNotReachableDuringInitialisation() {
        let pool = createPool(initialCapacity: 1, maxCapacity: 3, databaseActive: false)
        
        let conn = pool.getConnection()
        XCTAssertNil(conn)
        
        guard let testConn = conn as? SubTestConnection else {
            XCTFail("")
            return
        }
        
        testConn.isDatabaseReachable = true
        
        let conn2 = pool.getConnection()
        XCTAssertNotNil(conn2)
    }
    
    #warning("Add test for database starting dead, then coming back online")
    #warning("Add test for database dying mid use, then coming back online")
    #warning("")
    
    #warning("Is there a downside to this? Should it be allowed?")
    func testInitialCapacityLargerThanMaxCapacity() {
        let pool = createPool(initialCapacity: 2, maxCapacity: 1)
        
        print(pool.capacity)
        
        var c = pool.getConnection()
        var c2 = pool.getConnection()
        print(pool.capacity)
        c?.closeConnection()
        c = nil
        var c3 = pool.getConnection()
        print(pool.capacity)
    }
    
    //Is this expected behaviour?
    func testZeroMaxCapacity() {
        let pool = createPool(initialCapacity: 0, maxCapacity: 0)
        print(pool.capacity)
        print(pool.pool.count)
        print(pool.limit)
        
        let conn = pool.getConnection()
        print(pool.capacity)
        print(pool.pool.count)
        print(pool.limit)
        
        let conn2 = pool.getConnection()
        print(pool.capacity)
        print(pool.pool.count)
        print(pool.limit)
        
        conn?.closeConnection()
        conn2?.closeConnection()
    }
}
