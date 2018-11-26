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

import Dispatch
#if os(Linux)
    import Glibc
#else
    import Darwin
#endif
import LoggerAPI

// MARK: ConnectionPool

/**
 This class implements a first in, first out connection pool. The pool maintains a cache of `ConnectionPoolConnection` instances, which can be reused for future requests, to enhance performance.
### Usage Example: ###
In most cases, you will create a connection pool using a plugin, such as SwiftKuery-postgreSQL, which implements this class. You would then call the specific plugin with the required options. If you wish to create the a ConnectionPool manually you can use this example. Two closures to generate and release Connection instances are defined. A connection pool is then initialized with the defined closures and options. A single Connection is then retrieved from the pool.
 ```swift
 let options = ConnectionPoolOptions(initialCapacity: 2, maxCapacity: 5, timeout: 1000)
 let connectionGenerator: () -> Connection? = {
    let connection = PostgreSQLConnection(host: "localhost", port: 5432, options: [.databaseName("ExampleDatabase")])
    return connection
 }
 let connectionReleaser: (_ connection: Connection) -> () = { connection in
    connection.closeConnection()
 }
 let connectionPool = ConnectionPool(options: options, connectionGenerator: connectionGenerator, connectionReleaser: connectionReleaser)
 guard let singleConnection = connectionPool.getConnection() else {
    // handle error
    return
 }
 ```
 */

public class ConnectionPool {

    private var pool = [Connection]()

    // A serial dispatch queue used to ensure thread safety when accessing the pool
    // (at time of writing, serial is the default, and cannot be explicitly specified).
    private var poolLock = DispatchSemaphore(value: 1)
    
    // A generator function for items in the pool, which allows future expansion.
    private let generator: () -> Connection?
    
    // A releaser function for connections in the pool.
    private let releaser: (Connection) -> ()
    
    // The maximum size of this pool.
    private let limit: Int
    
    // The initial size of this pool.
    private var capacity: Int
    
    // A semaphore to enable take() to block when the pool is empty.
    private var semaphore: DispatchSemaphore
    
    // A timeout value (in nanoseconds) to wait before returning nil from a take().
    private let timeoutNs: Int64
    private let timeout: Int

    // An array of requests to run when a connection is available
    // The array is used to store user requests when no connection is available in the pool. Before a connection is released back to the pool any requests in the backlog will be processed.
    public typealias connectionPoolTask = ((ConnectionPoolConnection?, QueryError?) -> ())
    private var taskBacklog = [connectionPoolTask]()

    // MARK: Initializer
    /**
     Creates an instance of `ConnectionPool` containing `ConnectionPoolOptions.initialCapacity` connections.
     The `connectionGenerator` will be invoked `ConnectionPoolOptions.initialCapacity` times to fill
     the pool to the initial capacity.
     ### Usage Example: ###
     In this example, two closures to generate and release `Connection` instances are defined.
     A connection pool is then initialized with the given `options`, the `connectionGenerator` and the `connectionReleaser`.
     ```swift
     let options = ConnectionPoolOptions(initialCapacity: 2, maxCapacity: 5, timeout: 1000)
     let connectionGenerator: () -> Connection? = {
         let connection = PostgreSQLConnection(host: "localhost", port: 5432, options: [.databaseName("ExampleDatabase")])
         return connection
     }
     
     let connectionReleaser: (_ connection: Connection) -> () = { connection in
        connection.closeConnection()
     }
     
     let connectionPool = ConnectionPool(options: options, connectionGenerator: connectionGenerator, connectionReleaser: connectionReleaser)
     ```
    
     - Parameter options: `ConnectionPoolOptions` describing the pool configuration.
     - Parameter connectionGenerator: A closure that returns a new connection for the pool.
     - Parameter connectionReleaser: A closure to be used to release a connection from the pool.
    */
    public init(options: ConnectionPoolOptions, connectionGenerator: @escaping () -> Connection?, connectionReleaser: @escaping (Connection) -> ()) {
        capacity = options.initialCapacity
        if capacity < 1 {
            capacity = 1
        }
        limit = options.maxCapacity
        timeout = options.timeout
        timeoutNs = Int64(timeout) * 1000000  // Convert ms to ns
        generator = connectionGenerator
        releaser = connectionReleaser
        for _ in 0 ..< capacity {
            if let item = generator() {
                pool.append(item)
            }
            else {}
        }
        semaphore = DispatchSemaphore(value: pool.count)
        // Handle generation failure
        if pool.count < capacity {
            Log.warning("Connection generation failed (\(pool.count) of \(capacity) connections created")
            // Ensure capacity and pool.count are in sync. This enables us to recover
            // in the future if the database becomes reachable again.
            capacity = pool.count
        }
    }
    
    deinit {
        disconnect()
    }

    /**
     Get a connection from the pool.
     This function does not block, if a connection is not available the handler will be added to a queue to be process when a connection becomes available.
     ### Usage Example: ###
     A `Connection` instance is retrieved from a pool that was initialized previously.
     ```swift
     connectionPool.getConnection() { connection, error in
         guard let connection = connection else {
            guard let error = error else {
                // log unspecified error
            }
            // log returned error
         }
         // use connection
         connection.execute(.....) {}
     }
     ```
     - Parameter poolTask: A closure to execute when a connection is available.
     - Returns: A `Connection` or nil if the wait for a free connection timed out.
     */
    public func getConnection(poolTask: @escaping connectionPoolTask) {
        var item: Connection!

        // If there has been a connectivity problem the pool capacity can reach 0. The method below will attempt to generate a new connection which will allow the pool to repopulate with new connections.
        guard makeCapacityNonZero() else {
            clearRequestBacklog()
            return poolTask(nil, QueryError.connection("Unable to get connection to database"))
        }

        lockPoolLock()
        // make below a guard
        if (pool.count < 1) {
            taskBacklog.append(poolTask)
            return unlockPoolLock()
        }
        item = pool[0]
        pool.removeFirst()
        // Check if the item is alive, and replace with a new one if it isn't
        if item.isConnected == false {
            releaseItem(item)
            if let replacementItem = generateItem() {
                item = replacementItem
            } else {
                item = nil
            }
        }
        // If we took the last item, we can choose to grow the pool
        if (pool.count == 0 && capacity < limit) {
            _ = growPool()
        }
        guard let connection = item else {
            // We do not clear the request backlog here as it will be done by the first thread to detect zero capacity.
            taskBacklog.append(poolTask)
            return unlockPoolLock()
        }
        unlockPoolLock()
        return poolTask(ConnectionPoolConnection(connection: connection, pool: self), nil)
    }

    private func clearRequestBacklog() {
        lockPoolLock()
        for requestHandler in taskBacklog {
            DispatchQueue.global().async {
                requestHandler(nil, QueryError.connection("Unable to get connection from database"))
            }
        }
        taskBacklog = [connectionPoolTask]()
        unlockPoolLock()
    }

    func release(connection: Connection) {
        give(connection)
    }

    // MARK: Disconnect Pool
    /**
     Removes all the connections from the pool and calls the `connectionReleaser` closure on each.
     ### Usage Example: ###
     A previously initialized `ConnectionPool` is disconnected, thereby removing all of its connections from the pool.
     ```swift
     connectionPool.disconnect()
     ```
     */
    public func disconnect() {
        release()
    }
    
    // Check to see whether the pool's capacity has fallen to zero, and if so, attempt
    // to grow the pool so there is one item in it.
    //
    // Since the pool's capacity would only fall to zero when connectivity problems exist,
    // it is possible that the generation of a new connection will fail and the pool will
    // still have zero capacity.
    //
    // Returns true iff the pool has a non-zero capacity.
    private func makeCapacityNonZero() -> Bool {
        // Check capacity before locking, to avoid performance penalty in common case.
        // We'll check again in a locked context for safety.
        guard capacity == 0 else {
            return true
        }
        lockPoolLock()
        defer {
            unlockPoolLock()
        }
        guard capacity == 0 else {
            return true
        }
        return growPool()
    }
 
    // Try to generate a new connection and append it to the pool. The generator can fail
    // (for example, if the database cannot be reached), and if this occurs, a new connection
    // is not added.
    // This function does NOT lock the pool and should only be called from a locked context.
    //
    // Returns true iff a new connection was successfully added.
    private func growPool() -> Bool {
        if let newItem = generateItem() {
             pool.append(newItem)
             semaphore.signal()
             return true
        }
        return false
    }
 
    // Attempt to generate a new connection which will be part of the set of connections that
    // are owned by the pool.  If successful, the pool's capacity is incremented.
    // This function does NOT lock the pool and should only be called from a locked context.
    // 
    // Returns the new connection, if successful.
    private func generateItem() -> Connection? {
        if let newItem = generator() {
             capacity += 1
             return newItem
        }
        return nil
    }
 
    // Releases a connection and decrements the pool's capacity.
    // This function does NOT lock the pool and should only be called from a locked context.
    private func releaseItem(_ item: Connection) {
            releaser(item)
            capacity -= 1     
    }

    // Give an item back to the pool. Whilst this item would normally be one that was earlier
    // take()n from the pool, a new item could be added to the pool via this method.
    private func give(_ item: Connection) {
        // We need to check if there are task in the backlog and if so offload execution of one and return.
        lockPoolLock()
        guard taskBacklog.count == 0 else {
            let defferedTask = taskBacklog.removeFirst()
            runDeferedPoolTask(task: defferedTask, connection: item)
            return unlockPoolLock()
        }
        pool.append(item)
        // Signal that an item is now available
        semaphore.signal()
        return unlockPoolLock()
    }

    private func runDeferedPoolTask(task: @escaping connectionPoolTask, connection: Connection) {
        DispatchQueue.global().async {
            task(ConnectionPoolConnection(connection: connection, pool: self), nil)
        }
    }
    
    // Remove all connections in the pool, calling releaser on each, leaving the pool empty.
    private func release() {
        lockPoolLock()
        for item in pool {
            releaseItem(item)
        }
        pool.removeAll()
        unlockPoolLock()
    }
    
    private func lockPoolLock() {
        _ = poolLock.wait(timeout: DispatchTime.distantFuture)
    }
    
    private func unlockPoolLock() {
        poolLock.signal()
    }
}
