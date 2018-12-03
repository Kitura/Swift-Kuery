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

// MARK: ResultSet

/// Represents a query result set. The rows are accessable either in a blocking fashion using a `RowSequence` or in a non-blocking fashion using nextRow() function.
public class ResultSet {
    private var resultFetcher: ResultFetcher

    var connection: Connection? = nil

    /// Instantiate an instance of ResultSet.
    ///
    /// - Parameter resultFetcher: An implementation of `ResultFetcher` protocol to fetch the query results.
    public init(_ resultFetcher: ResultFetcher, connection: Connection) {
        self.resultFetcher = resultFetcher
        self.connection = connection
    }

    /// Fetch the next row of the query result. This function is non-blocking.
    ///
    /// - Parameter callback: A callback to call when the next row of the query result is ready.
    public func nextRow(callback: @escaping (([Any?]?, Error?)) ->()) {
        resultFetcher.fetchNext { row, error in
            callback((row, error))
        }
    }

    /// Fetch the column titles of the query result. This function is non-blocking
    public func getColumnTitles( callback: @escaping (([String]?, Error?)) -> ()) {
        resultFetcher.fetchTitles(callback: callback)
    }

    /// Called to indicate no further operations will be called on the result set.
    /// A ResultSet will keep a connection alive until this method is called.
    /// When called this method enables the underlying connection to be released and in the case where a connection pool is used, returned to the pool for reuse.
    public func done() {
        // Nil connection reference once result fetcher cleanup is complete.
        resultFetcher.done()
        self.connection = nil
    }

    /// Type alias for closures to be passed to the forEach method
    public typealias RowOperation = ([Any?]?, Error?) -> Void

    /// Type alias for closures to be passed to the forEach method which allows asynchronous opertions.
    public typealias RowOperationWithNext = ([Any?]?, Error?, () -> Void) -> Void

    /// Execute the supplied RowOperation against each row returned from the database
    ///
    /// - Parameter operation: A callback to be executed against each row in the result set.
    public func forEach(operation: @escaping RowOperation) {
        resultFetcher.fetchNext { row, error in
            operation(row, error)
            if row != nil {
                self.forEach(operation: operation)
            }
        }
    }

    /// Execute the supplied RowOperation against each row returned from the database
    ///
    /// - Parameter operation: A callback to be executed against each row in the result set.
    public func forEach(operation: @escaping RowOperationWithNext) {
        resultFetcher.fetchNext { row, error in
            operation(row, error, {
                self.forEach(operation: operation)
            })
        }
    }
}
