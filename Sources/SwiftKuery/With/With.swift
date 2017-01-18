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

// MARK: With

/// Create a query with WITH clause.
///
/// - Parameter table: A table for WITH clause.
/// - Parameter query: A query that will use table from WITH clause.
public func With(_ table: WithTable, _ query: Select) -> Select {
    return With([table], query)
}

/// Create a query with WITH clause.
///
/// - Parameter tables: An array of tables for WITH clause.
/// - Parameter query: A query that will use table from WITH clause.
public func With(_ tables: [WithTable], _ query: Select) -> Select {
    return query.with(tables)
}
