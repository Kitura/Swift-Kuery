/**
 Copyright IBM Corporation 2016, 2017
 
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

// MARK: Parameter

/// Query parameter, either numbered, or named, or just marked with a marker.
public struct Parameter: Buildable {
    /// An optional name of the parameter.
    public private (set) var name: String?
    
    /// Initialize an instance of Parameter.
    ///
    /// - Parameter name: An optional name of the parameter.
    public init(_ name: String?=nil) {
        self.name = name
    }
    
    static var numberedParameterMarker = "\u{00}\u{01}\u{01}\u{00}"
    static var namedParameterStart = "\u{01}\u{02}\u{02}\u{01}"
    static var namedParameterEnd = "\u{02}\u{03}\u{03}\u{02}"
    
    /// Build the parameter using `QueryBuilder`. If the parameter's name is set,
    /// return it along with the named parameter marker in `QueryBuilder`. Otherwise, 
    /// return the numbered parameter marker in `QueryBuilder`. 
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the parameter.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        if let name = name {
            let marker = queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.namedParameter.rawValue]
            if marker == "" {
                return Parameter.namedParameterStart + name + Parameter.namedParameterEnd
            }
            else {
                return marker + name
            }
        }
        else {
            return Parameter.numberedParameterMarker
        }
    }
}
