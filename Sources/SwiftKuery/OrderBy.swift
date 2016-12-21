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

// MARK: OrderBy

/// An SQL ORDER BY clause.
public enum OrderBy: Buildable {
    /// Order ascending.
    case ASC(Field)
    /// Order descending.
    case DESC(Field)
        
    /// Build the query component using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query component.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        switch self {
        case .ASC(let field):
            return try field.build(queryBuilder: queryBuilder) + " ASC"
        case .DESC(let field):
            return try field.build(queryBuilder: queryBuilder) + " DESC"
        }
    }
}

