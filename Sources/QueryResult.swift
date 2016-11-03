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

// MARK: QueryResult

/// The result of the query execution.
public enum QueryResult {
    /// An error occurred while executing the query.
    case error(Error)
    /// The result of the query execution as an Array of column titles and an Array of table rows.
    case rows(titles: [String], rows: [[Any?]])
    /// An indication whether the query was succesfully executed.
    case success(Any)
    /// An indication whether the query was succesfully executed, and returned no data.
    case successNoData
    
    /// An indication whether the query was succesfully executed.
    public var success: Bool {
        switch self {
        case .error:
            return false
        default:
            return true
        }
    }
    
    /// Data received from the query execution represented as a tuple of (titles, rows),
    /// where titles are the names of the returned columns,
    /// and rows are an Array of rows, i.e., an Array of Arrays of values.
    public var asRows: ([String], [[Any?]])? {
        switch self {
        case .rows(let titles, let rows):
            return (titles, rows)
        default:
            return nil
        }
    }
    
    /// An error that may occur during query execution.
    public var asError: Error? {
        switch self {
        case .error(let error):
            return error
        default:
            return nil
        }
    }
    
    /// The result of the query execution as a single value.
    public var asValue: Any? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }
}

