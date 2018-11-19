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

// MARK: ResultFetcher protocol

/// A protocol for retrieving query results. All database plugins must implement this protocol.
public protocol ResultFetcher {
    
    /// Fetch the next row of the query result. This function is non-blocking.
    ///
    /// - Parameter callback: A callback to call when the next row of the query result is ready.
    func fetchNext(callback: @escaping ([Any?]?) ->())

    /// Fetch the titles of the query result. This function is non-blocking.
    ///
    /// - Parameter callback: A callback to call when the column titles of the query result are ready.
    func fetchTitles(callback: @escaping (_ titles: [String?]?) -> ())

    /// Closes any underlying database connections and releases system resources synchronously
    ///
    func done()
}
