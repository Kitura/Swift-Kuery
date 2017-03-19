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

/// A connection pool implementation.
/// The pool is FIFO.

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
    
    /// Creates an instance of `ConnectionPool` containing `ConnectionPoolOptions.initialCapacity` connections.
    /// The `connectionGenerator` will be invoked `ConnectionPoolOptions.initialCapacity` times to fill
    /// the pool to the initial capacity.
    ///
    /// - Parameter options: `ConnectionPoolOptions` describing pool configuration.
    /// - Parameter connectionGenerator: A closure that returns a new connection for the pool.
    /// - Parameter connectionReleaser: A closure to be used to release a connection from the pool.
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
    
    /// Get a connection from the pool.
    /// This function will block until a connection can be obtained from the pool or for `ConnectionPoolOptions.timeout`.
    ///
    /// - Returns: A `Connection` or nil if the wait for a free connection timed out.
    public func getConnection() -> Connection? {
        if let connection = take() {
            return ConnectionPoolConnection(connection: connection, pool: self)
        }
        return nil
    }
    
    func release(connection: Connection) {
        give(connection)
    }
    
    /// Release all the connections in the pool by calling connectionReleaser closure on each connection,
    /// and empty the pool.
    public func disconnect() {
        release()
    }
    
    // Take an item from the pool. The item will not magically rejoin the pool when no longer
    // needed, so MUST later be returned to the pool with give() if it is to be reused.
    // Items can therefore be borrowed or permanently removed with this method.
    //
    // This function will block until an item can be obtained from the pool. 
    private func take() -> Connection? {
        var item: Connection!
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
        // If we took the last item, we can choose to grow the pool
        if (pool.count == 0 && capacity < limit) {
            capacity += 1
            if let newItem = generator() {
                pool.append(newItem)
                semaphore.signal()
            }
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
    
    private func release() {
        lockPoolLock()
        for item in pool {
            releaser(item)
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
