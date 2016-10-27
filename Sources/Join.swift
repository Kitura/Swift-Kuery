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

public enum Join {
    case join(Table)
    case left(Table)
    case right(Table)
    case full(Table)
    case cross(Table)
    case natural(Table)
    case naturalLeft(Table)
    case naturalRight(Table)
    case naturalFull(Table)

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

