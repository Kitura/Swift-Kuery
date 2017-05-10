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

// MARK: IndexColumnOrdered

/// An enumeration for columns used in indices along with their sort order.
public enum IndexColumnOrdered: IndexColumn {
    public var table: Table {
        switch self {
        case .ASC(let column):
            return column.table
        case .DESC(let column):
            return column.table
        }
    }
    
    /// Order ascending.
    case ASC(Column)
    /// Order descending.
    case DESC(Column)
    
    /// Build the index column using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the index column.
    public func buildIndex(queryBuilder: QueryBuilder) -> String {
        switch self {
        case .ASC(let column):
            return column.buildIndex(queryBuilder: queryBuilder) + " ASC"
        case .DESC(let column):
            return column.buildIndex(queryBuilder: queryBuilder) + " DESC"
        }
    }
}


/// Create a IndexColumnOrdered.ASC for the column.
///
/// - Parameter column: The column to apply IndexColumnOrdered.ASC.
/// - Returns: IndexColumnOrdered.ASC for the column.
public func asc(_ column: Column) -> IndexColumnOrdered {
    return IndexColumnOrdered.ASC(column)
}

/// Create a IndexColumnOrdered.DESC for the column.
///
/// - Parameter column: The column to apply IndexColumnOrdered.ASC.
/// - Returns: IndexColumnOrdered.DESC for the column.
public func desc(_ column: Column) -> IndexColumnOrdered {
    return IndexColumnOrdered.DESC(column)
}
