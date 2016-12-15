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


// MARK: Field protocol

/// Defines the protocol for columns, and aggregate and scalar functions on columns.
public protocol Field: Buildable {
    
    /// The alias of the field.
    var alias: String? { get set }
    
    /// Add an alias to the field, i.e., implement the SQL AS operator.
    ///
    /// - Parameter newName: A String containing the alias for the field.
    /// - Returns: A new Field instance with the alias.
    func `as`(_ newName: String) -> Field
}

public extension Field {
    /// Add an alias to the field, i.e., implement the SQL AS operator.
    ///
    /// - Parameter newName: A String containing the alias for the field.
    /// - Returns: A new Field instance with the alias.
    public func `as`(_ newName: String) -> Field {
        var new = self
        new.alias = newName
        return new
    }
}
