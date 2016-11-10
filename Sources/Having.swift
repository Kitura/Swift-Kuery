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

// MARK: Having

import Foundation

/// An SQL HAVING clause.
public struct Having : Buildable {
    /// The left hand side of the conditional clause.
    public let lhs: HavingPredicate
    /// The left hand side of the conditional clause.
    public let rhs: HavingPredicate
    /// The operator of the conditional clause.
    public let condition: Condition
    
    init(lhs: HavingPredicate, rhs: HavingPredicate, condition: Condition) {
        self.lhs = lhs
        self.rhs = rhs
        self.condition = condition
    }
    
    /// Build the clause using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the clause.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        let lhsBuilt = try lhs.build(queryBuilder: queryBuilder)
        let conditionBuilt = condition.build(queryBuilder: queryBuilder)
        var rhsBuilt = ""
        if condition == .between || condition == .notBetween {
            switch rhs {
            case .arrayOfString(let array):
                rhsBuilt = packType(array[0]) + " AND " + packType(array[1])
            case .arrayOfInt(let array):
                rhsBuilt = packType(array[0]) + " AND " + packType(array[1])
            case .arrayOfFloat(let array):
                rhsBuilt = packType(array[0]) + " AND " + packType(array[1])
            case .arrayOfDouble(let array):
                rhsBuilt = packType(array[0]) + " AND " + packType(array[1])
            case .arrayOfBool(let array):
                rhsBuilt = packType(array[0]) + " AND " + packType(array[1])
            case .arrayOfParameter(let array):
                rhsBuilt = try packType(array[0], queryBuilder: queryBuilder) + " AND " + packType(array[1], queryBuilder: queryBuilder)
            default:
                throw QueryError.syntaxError("Wrong type for rhs operand in \(conditionBuilt) expression")
            }
        }
        else if condition == .in || condition == .notIn {
            switch rhs {
            case .arrayOfString(let array):
                rhsBuilt = "(\(array.map { packType($0) }.joined(separator: ", ")))"
            case .arrayOfInt(let array):
                rhsBuilt = "(\(array.map { packType($0) }.joined(separator: ", ")))"
            case .arrayOfFloat(let array):
                rhsBuilt = "(\(array.map { packType($0) }.joined(separator: ", ")))"
            case .arrayOfDouble(let array):
                rhsBuilt = "(\(array.map { packType($0) }.joined(separator: ", ")))"
            case .arrayOfBool(let array):
                rhsBuilt = "(\(array.map { packType($0) }.joined(separator: ", ")))"
            case .arrayOfParameter(let array):
                rhsBuilt = try "(\(array.map { try packType($0, queryBuilder: queryBuilder) }.joined(separator: ", ")))"
            default:
                throw QueryError.syntaxError("Wrong type for rhs operand in \(conditionBuilt) expression")
            }
        }
        else {
            rhsBuilt = try rhs.build(queryBuilder: queryBuilder)
        }
        return lhsBuilt + " " + conditionBuilt + " " + rhsBuilt
    }
    
    /// An operand of `Having`: either a `Having` itself, or a value, a column, or an `AggregateColumnExpression`.
    public indirect enum HavingPredicate : Buildable {
        /// A `Having` clause.
        case havingClause(Having)
        /// A String.
        case string(String)
        /// An integer.
        case int(Int)
        /// A float.
        case float(Float)
        /// A double.
        case double(Double)
        /// A boolean.
        case bool(Bool)
        /// An array of String.
        case arrayOfString([String])
        /// An array of Int.
        case arrayOfInt([Int])
        /// An array of Float.
        case arrayOfFloat([Float])
        /// An array of Double.
        case arrayOfDouble([Double])
        /// An array of Bool.
        case arrayOfBool([Bool])
        /// A `Column`.
        case column(Column)
        /// An `AggregateColumnExpression`.
        case aggregateColumnExpression(AggregateColumnExpression)
        /// A parameter.
        case parameter(Parameter)
        /// An array of Parameter.
        case arrayOfParameter([Parameter])
        
        /// Build the having predicate using `QueryBuilder`.
        ///
        /// - Parameter queryBuilder: The QueryBuilder to use.
        /// - Returns: A String representation of the havinh predicate.
        /// - Throws: QueryError.syntaxError if query build fails.
        public func build(queryBuilder: QueryBuilder) throws -> String {
            switch self {
            case .havingClause(let havingClause):
                return try "(" + havingClause.build(queryBuilder: queryBuilder) + ")"
            case .string(let string):
                return packType(string)
            case .int(let value):
                return packType(value)
            case .float(let value):
                return packType(value)
            case .double(let value):
                return packType(value)
            case .bool(let value):
                return String(value)
            case .column(let column):
                return "(" + column.build(queryBuilder: queryBuilder) + ")"
            case .aggregateColumnExpression(let aggregateColumnExpression):
                return try "(" + aggregateColumnExpression.build(queryBuilder: queryBuilder) + ")"
            case .parameter(let parameter):
                return try parameter.build(queryBuilder: queryBuilder)
            default:
                return ""
            }
        }
    }
}

public func || (lhs: Having, rhs: Having) -> Having {
    return Having(lhs: .havingClause(lhs), rhs: .havingClause(rhs), condition: .or)
}

public func && (lhs: Having, rhs: Having) -> Having {
    return Having(lhs: .havingClause(lhs), rhs: .havingClause(rhs), condition: .and)
}
