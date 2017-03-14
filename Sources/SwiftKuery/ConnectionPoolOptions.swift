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


// MARK: ConnectionPoolOptions

/// Options for `ConectionPool` configuration.
public struct ConnectionPoolOptions {
    /// The initial number of connections in the pool.
    public let initialCapacity: Int
    
    /// The maximum number of connections in the pool. The pool is allowed to grow from `initialCapacity` up to
    /// this limit. If not specified, or `maxCapacity` <= `initialCapacity`, the pool cannot grow.
    public let maxCapacity: Int
    
    /// Maximum wait (in milliseconds) to receive a connection before returning nil. If set to 0 (default), there will be
    /// no timeout, i.e., the wait may block forever.
    public let timeout: Int
    
    /// Initialize an instance of `ConnectionPoolOptions`.
    ///
    /// - Parameter initialCapacity: The initial number of connections in the pool.
    /// - Parameter maxCapacity: The maximum number of connections in the pool
    /// - Parameter timeout: Maximum wait (in milliseconds) to receive a connection before returning nil.
    public init(initialCapacity: Int, maxCapacity: Int = 0, timeout: Int = 0) {
        self.initialCapacity = initialCapacity
        self.maxCapacity = maxCapacity
        self.timeout = timeout
    }
}
