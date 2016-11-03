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
        return try lhs.build(queryBuilder: queryBuilder) + " " + condition.build(queryBuilder: queryBuilder) + " " + rhs.build(queryBuilder: queryBuilder)
    }
    
    /// An operand of `Having`: either a `Having` itself, or a value, a column, or an `AggregateColumnExpression`.
    public indirect enum HavingPredicate : Buildable {
        /// A `Having` clause.
        case havingClause(Having)
        /// A String.
        case string(String)
        /// A number.
        case number(NSNumber)
        /// A value of type Any.
        case value(Any)
        /// A `Column`.
        case column(Column)
        /// An `AggregateColumnExpression`.
        case aggregateColumnExpression(AggregateColumnExpression)
        
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
            case .number(let number):
                return packType(number)
            case .value(let value):
                return packType(value)
            case .column(let column):
                return "(" + column.build(queryBuilder: queryBuilder) + ")"
            case .aggregateColumnExpression(let aggregateColumnExpression):
                return try "(" + aggregateColumnExpression.build(queryBuilder: queryBuilder) + ")"
            }
        }
    }
}

public func == (lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .string(rhs), condition: .equal)
}

public func == (lhs: Column, rhs: String) -> Having {
    return Having(lhs: .column(lhs), rhs: .string(rhs), condition: .equal)
}

public func == (lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .number(NSNumber(value: rhs)), condition: .equal)
}

public func > (lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .number(NSNumber(value: rhs)), condition: .greaterThan)
}

public func > (lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .number(NSNumber(value: rhs)), condition: .greaterThan)
}

public func == (lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .number(NSNumber(value: rhs)), condition: .equal)
}

public func || (lhs: Having, rhs: Having) -> Having {
    return Having(lhs: .havingClause(lhs), rhs: .havingClause(rhs), condition: .or)
}

public func && (lhs: Having, rhs: Having) -> Having {
    return Having(lhs: .havingClause(lhs), rhs: .havingClause(rhs), condition: .and)
}
