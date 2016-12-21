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

// MARK: RawField

/// An arbitrary field represented by a String.
public struct RawField: Field {
    /// A String containg the field.
    public let field: String
    
    /// The alias of the field.
    public var alias: String?
    
    /// Initialize an instance of RawField.
    ///
    /// - Parameter field: A String containing the field.
    public init(_ field: String) {
        self.field = field
    }
    
    /// Build the field using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the field.
    public func build(queryBuilder: QueryBuilder) -> String {
        var result = field
        if let alias = alias {
            result += " AS " + alias
        }
        return result
    }
}
