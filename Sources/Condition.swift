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

// MARK: Condition

/// An enumeration of condition operators supported in `Filter` and `Having`.
public enum Condition: Buildable {
    /// The SQL == operator.
    case equal
    /// The SQL != operator.
    case notEqual
    /// The SQL > operator.
    case greaterThan
    /// The SQL < operator.
    case lessThan
    /// The SQL >= operator.
    case greaterThanOrEqual
    /// The SQL <= operator.
    case lessThanOrEqual
    /// The SQL BETWEEN operator.
    case between
    /// The SQL NOT BETWEEN operator.
    case notBetween
    /// The SQL LIKE operator.
    case like
    /// The SQL LIKE operator.
    case notLike
    /// The SQL IN operator.
    case `in`
    /// The SQL NOT IN operator.
    case notIn
    /// The SQL EXISTS operator.
    case exists
    /// The SQL NOT EXISTS operator.
    case notExists
    /// The SQL IS NULL operator.
    case isNull
    /// The SQL IS NOT NULL operator.
    case isNotNull
    /// The SQL AND operator.
    case and
    /// The SQL OR operator.
    case or
    
    /// Build the condition, i.e., return its representation as a String.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the condition.
    public func build(queryBuilder: QueryBuilder) -> String {
        switch self {
        case .equal:
            return "="
        case .notEqual:
            return "<>"
        case .greaterThan:
            return ">"
        case .lessThan:
            return "<"
        case .greaterThanOrEqual:
            return ">="
        case .lessThanOrEqual:
            return "<="
        case .between:
            return "BETWEEN"
        case .notBetween:
            return "NOT BETWEEN"
        case .like:
            return "LIKE"
        case .notLike:
            return "NOT LIKE"
        case .in:
            return "IN"
        case .notIn:
            return "NOT IN"
        case .exists:
            return "EXISTS"
        case .notExists:
            return "NOT EXISTS"
        case .isNull:
            return "IS NULL"
        case .isNotNull:
            return "IS NOT NULL"
        case .and:
            return "AND"
        case .or:
            return "OR"
        }
    }
}

