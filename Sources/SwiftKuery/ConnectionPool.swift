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

// MARK: ConnectionPool

/**
 This class implements a First in First out connection pool. The pool maintains a cache of `ConnectionPoolConnection` instances, which can be reused for future requests, to enhance performance.
 ### Usage Example: ###
 In this example, a closure to generate and release `Connection` instances are defined.
 A connection pool is then initialized with defined options, the `connectionGenerator` and the `connectionReleaser`.
 A single `Connection` is then retrieved from the pool.
 ```swift
 let options = ConnectionPoolOptions(initialCapacity: 2, maxCapacity: Int = 5, timeout: Int = 1000)
 let connectionGenerator: () -> Connection? = {
    let connection = PostgreSQLConnection(connectionParameters: connectionParameters)
    return connection
 }
 let connectionReleaser: (_ connection: Connection) -> () = { connection in
 connection.closeConnection()
 }
 let connectionPool = ConnectionPool(options: options, connectionGenerator: connectionGenerator, connectionReleaser: connectionReleaser)
 }
 let singleConnection = connectionPool.getConnection()
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
    
    // MARK: Initializer
    /**
     Creates an instance of `ConnectionPool` containing `ConnectionPoolOptions.initialCapacity` connections.
     The `connectionGenerator` will be invoked `ConnectionPoolOptions.initialCapacity` times to fill
     the pool to the initial capacity.
     ### Usage Example: ###
     In this example, a closure to generate and release `Connection` instances are defined.
     A connection pool is then initialized with given options, the `connectionGenerator` and the `connectionReleaser`.
     ```swift
     let options = ConnectionPoolOptions(initialCapacity: 2, maxCapacity: Int = 5, timeout: Int = 1000)
     let connectionGenerator: () -> Connection? = {
     let connection = PostgreSQLConnection(connectionParameters: connectionParameters)
     return connection
     }
     
     let connectionReleaser: (_ connection: Connection) -> () = { connection in
     connection.closeConnection()
     }
     
     let connectionPool = ConnectionPool(options: options, connectionGenerator: connectionGenerator, connectionReleaser: connectionReleaser)
     }
     ```
    
     - Parameter options: `ConnectionPoolOptions` describing pool configuration.
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
        semaphore = DispatchSemaphore(value: capacity)
        for _ in 0 ..< capacity {
            if let item = generator() {
                pool.append(item)
            }
            else {} // TODO: Handle generation failure.
        }
    }
    
    deinit {
        disconnect()
    }
    
    // MARK: Retrieve Connection
    /**
     Get a connection from the pool.
     This function will block until a connection can be obtained from the pool or for `ConnectionPoolOptions.timeout`.
     ### Usage Example: ###
     A `Connection` instance is then retrieved from an pool that was previously initialized.
     ```swift
     let connection = connectionPool.getConnection()
     ```
    
     - Returns: A `Connection` or nil if the wait for a free connection timed out.
    */
    public func getConnection() -> Connection? {
        if let connection = take() {
            return ConnectionPoolConnection(connection: connection, pool: self)
        }
        return nil
    }
    
    func release(connection: Connection) {
        give(connection)
    }
    
    // MARK: Disconnect Pool
    /**
     Release all the connections in the pool by calling `connectionReleaser` closure on each connection, and empty the pool.
     ### Usage Example: ###
     A `previously initialized `ConnectionPool` is disconnected removing all connections in the pool.
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
 
    // Take an item from the pool. The item will not magically rejoin the pool when no longer
    // needed, so MUST later be returned to the pool with give() if it is to be reused.
    // Items can therefore be borrowed or permanently removed with this method.
    //
    // This function will block until an item can be obtained from the pool. 
    private func take() -> Connection? {
        var item: Connection!
     
        // We must return early if the pool has zero capacity, because no-one will ever call
        // give() to return a connection (and unblock the semaphore.wait below) in this
        // situation. Try to seed the pool with a new connection so we can continue.
        guard makeCapacityNonZero() else {
            return nil
        }
     
        // Indicate that we are going to take an item from the pool. The semaphore will
        // block if there are currently no items to take, until one is returned via give()
        let result = semaphore.wait(timeout: (timeout == 0) ? .distantFuture : .now() + DispatchTimeInterval.milliseconds(timeout))
        if result == DispatchTimeoutResult.timedOut {
            return nil
        }
        // We have permission to take an item - do so in a thread-safe way
        lockPoolLock()
        if (pool.count < 1) {
            unlockPoolLock()
            return nil
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
        unlockPoolLock()
        return item
    }
    
    // Give an item back to the pool. Whilst this item would normally be one that was earlier
    // take()n from the pool, a new item could be added to the pool via this method.
    private func give(_ item: Connection) {
        lockPoolLock()
        pool.append(item)
        // Signal that an item is now available
        semaphore.signal()
        unlockPoolLock()
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
