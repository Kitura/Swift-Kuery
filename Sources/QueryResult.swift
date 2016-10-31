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

public enum QueryResult {
    case error(Error)
    case rows(titles: [String], rows: [[Any?]])
    case success(Any)
    case successNoData
    //...
    
    public var success: Bool {
        switch self {
        case .error:
            return false
        default:
            return true
        }
    }
    
    public var asRows: ([String], [[Any?]])? {
        switch self {
        case .rows(let titles, let rows):
            return (titles, rows)
        default:
            return nil
        }
    }
    
    public var asError: Error? {
        switch self {
        case .error(let error):
            return error
        default:
            return nil
        }
    }
    
    public var asValue: Any? {
        switch self {
        case .success(let value):
            return value
            
        default:
            return nil
        }
    }
}

