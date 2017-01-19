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

// MARK: With

/// Create a query with a WITH clause.
///
/// - Parameter table: A table for a WITH clause.
/// - Parameter query: A SELECT query that will use the table from the WITH clause.
public func with(_ table: AuxiliaryTable, _ query: Select) -> Select {
    return with([table], query)
}

/// Create a query with a WITH clause.
///
/// - Parameter tables: An array of tables for a WITH clause.
/// - Parameter query: A SELECT query that will use the table from the WITH clause.
public func with(_ tables: [AuxiliaryTable], _ query: Select) -> Select {
    return query.with(tables)
}
