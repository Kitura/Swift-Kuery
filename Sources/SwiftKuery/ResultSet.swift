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
public struct ResultSet {
    private var resultFetcher: ResultFetcher
    
    /// The query result as a Sequence of rows. This API is blocking.
    public private (set) var rows: RowSequence
    
    /// Instantiate an instance of ResultSet.
    ///
    /// - Parameter resultFetcher: An implementation of `ResultFetcher` protocol to fetch the query results.
    public init(_ resultFetcher: ResultFetcher) {
        self.resultFetcher = resultFetcher
        rows = RowSequence(resultFetcher)
    }
    
    /// Fetch the next row of the query result. This function is non-blocking.
    ///
    /// - Parameter callback: A callback to call when the next row of the query result is ready.
    public func nextRow(callback: (_ row: [Any?]?) ->()) {
        resultFetcher.fetchNext { row in
            callback(row)
        }
    }
    
    /// The column titles of the query result. This function is blocking.
    public var titles: [String] {
        return resultFetcher.fetchTitles()
    }
}
