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

// MARK: QueryBuilder

/// A table of query substituions per connection.
/// Since different databases have different query syntax, sometimes connections
/// need to make changes in the query. The changes should be done by updating QueryBuilder
/// substitutions array. Every query component then builds its string representation using
/// that array.
public class QueryBuilder {
    /// An array of substitutions to be made in query String representation.
    public var substitutions: [String]
    
    /// The index for the substitutions array.
    public enum QuerySubstitutionNames : Int {
        /// The SQL UCASE scalar function.
        case ucase
        /// The SQL LCASE scalar function.
        case lcase
        /// The SQL LEN scalar function.
        case len
        /// The marker for the query numbered parameters.
        case numberedParameter
        /// The marker for the query named parameters.
        case namedParameter
        /// Last case, add new values before it.
        case namesCount
    }
    
    /// An indication whether the parameters should be numbered (e.g., '$1, $2'), or just marked
    /// with the numbered parameter marker (e.g., '?').
    public var addNumbersToParameters = true
    /// The starting index for numbered parameters.
    public var firstParameterIndex = 1
    
    /// Initialize an instance of QueryBuilder.
    ///
    /// - Parameter addNumbersToParameters: An indication whether query parameters should be numbered.
    /// - Parameter firstParameterIndex: The starting index for numbered parameters.
    public init(addNumbersToParameters: Bool?=nil, firstParameterIndex: Int?=nil) {
        substitutions = Array(repeating: "", count: QuerySubstitutionNames.namesCount.rawValue)
        substitutions[QuerySubstitutionNames.ucase.rawValue] = "UCASE"
        substitutions[QuerySubstitutionNames.lcase.rawValue] = "LCASE"
        substitutions[QuerySubstitutionNames.len.rawValue] = "LEN"
        substitutions[QuerySubstitutionNames.numberedParameter.rawValue] = "?"
        substitutions[QuerySubstitutionNames.namedParameter.rawValue] = "@"
        if let addNumbersToParameters = addNumbersToParameters {
            self.addNumbersToParameters = addNumbersToParameters
        }
        if let firstParameterIndex = firstParameterIndex {
            self.firstParameterIndex = firstParameterIndex
        }
    }
    
    /// Update substitutions array.
    ///
    /// - Parameter newSubstitutions: A Dictionary containing the entries to update.
    public func updateSubstitutions(_ newSubstitutions: [QuerySubstitutionNames:String]) {
        for (index, substitution) in newSubstitutions {
            substitutions[index.rawValue] = substitution
        }
    }
}
