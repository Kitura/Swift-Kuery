/**
 Copyright IBM Corporation 2017
 
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

// MARK: AuxiliaryTable

/// Subclasses of the `AuxiliaryTable` class are describing a table that is used in WITH clauses.
open class AuxiliaryTable: Table {
    
    /// A query used to build table in WITH clause
    private var query: Query?
    
    /// Initialize an instance of `AuxiliaryTable`.
    ///
    /// - Parameter query: A query that will be used in WITH clause.
    public convenience init(as query: Query) {
        self.init()
        self.query = query
    }
    
    /// Build the WITH clause using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func buildWith(queryBuilder: QueryBuilder) throws -> String {
        guard let query = query else {
            throw QueryError.syntaxError("With query was not specified. ")
        }
        return Utils.packName(nameInQuery, queryBuilder: queryBuilder) + " AS " + "(" + (try query.build(queryBuilder: queryBuilder)) + ")"
    }
    
}
