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

// MARK: Join

/// The SQL SELECT JOIN statement.
public enum Join: Buildable {
    /// The SQL INNER JOIN statement.
    case join(Table)
    /// The SQL LEFT OUTER JOIN statement.
    case left(Table)
    /// The SQL RIGHT OUTER JOIN statement.
    case right(Table)
    /// The SQL FULL OUTER JOIN statement.
    case full(Table)
    /// The SQL CROSS JOIN statement.
    case cross(Table)
    /// The SQL NATURAL INNER JOIN statement.
    case natural(Table)
    /// The SQL NATURAL LEFT OUTER JOIN statement.
    case naturalLeft(Table)
    /// The SQL NATURAL RIGHT OUTER JOIN statement.
    case naturalRight(Table)
    /// The SQL NATURAL FULL OUTER JOIN statement.
    case naturalFull(Table)

    /// Build the query component using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query component.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) -> String {
        switch self {
        case .join(let table):
            return " JOIN " + table.build(queryBuilder: queryBuilder)
        case .left(let table):
            return " LEFT JOIN " + table.build(queryBuilder: queryBuilder)
        case .right(let table):
            return " RIGHT JOIN " + table.build(queryBuilder: queryBuilder)
        case .full(let table):
            return " FULL JOIN " + table.build(queryBuilder: queryBuilder)
        case .cross(let table):
            return " CROSS JOIN " + table.build(queryBuilder: queryBuilder)
        case .natural(let table):
            return " NATURAL JOIN " + table.build(queryBuilder: queryBuilder)
        case .naturalLeft(let table):
            return " NATURAL LEFT JOIN " + table.build(queryBuilder: queryBuilder)
        case .naturalRight(let table):
            return " NATURAL RIGHT JOIN " + table.build(queryBuilder: queryBuilder)
        case .naturalFull(let table):
            return " NATURAL FULL JOIN " + table.build(queryBuilder: queryBuilder)
        }
    }
}

