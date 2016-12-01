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

// MARK: RowSequence

/// A query result as a Sequence of rows.
public struct RowSequence: Sequence, IteratorProtocol  {
    private var resultFetcher: ResultFetcher
    
    init(_ resultFetcher: ResultFetcher) {
        self.resultFetcher = resultFetcher
    }
    
    /// Get the next row. This function is blocking.
    ///
    /// - Returns: An array of values of type Any? representing the next row from the query result set.
    public mutating func next() -> [Any?]? {
        return resultFetcher.fetchNext()
    }
}
