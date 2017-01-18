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

// MARK: Select

/// Select query extension to enable with clauses.
extension Select {
    
    /// Set tables to be used for WITH clause.
    ///
    /// - Parameter tables: A list of the `OrderBy` to apply.
    /// - Returns: A new instance of Select with tables for WITH clause.
    internal func with(_ tables: [WithTable]) -> Select {
        var new = self
        if new.with != nil {
            new.syntaxError += "Multiple with clauses. "
        }
        else {
            new.with = tables
        }
        return new
    }
}
