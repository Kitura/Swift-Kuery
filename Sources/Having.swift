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

/// An SQL HAVING clause.
public struct Having: ConditionalClause, QueryHavingProtocol {
    public typealias ClauseType = Having
    public typealias ColumnExpressionType = AggregateColumnExpression
    /// The left hand side of the conditional clause.
    public let lhs: Predicate<Having, AggregateColumnExpression>?
    /// The right hand side of the conditional clause.
    public let rhs: Predicate<Having, AggregateColumnExpression>?
    /// The operator of the conditional clause.
    public let condition: Condition
    
    init(lhs: Predicate<Having, AggregateColumnExpression>?=nil, rhs: Predicate<Having, AggregateColumnExpression>?=nil, condition: Condition) {
        self.lhs = lhs
        self.rhs = rhs
        self.condition = condition
    }
}

// MARK: QueryHavingProtocol

/// Defines the protocol which should be used for all HAVING clauses.
/// Represents a HAVING clause as String value.
public protocol QueryHavingProtocol: Buildable {
    
}

// MARK Global functions

/// Create a `Having` clause using the OR operator.
///
/// - Parameter lhs: A `Having` - the left hand side of the clause.
/// - Parameter rhs: A `Having` - the right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func || (lhs: Having, rhs: Having) -> Having {
    return Having(lhs: .clause(lhs), rhs: .clause(rhs), condition: .or)
}

/// Create a `Having` clause using the AND operator.
///
/// - Parameter lhs: A `Having` - the left hand side of the clause.
/// - Parameter rhs: A `Having` - the right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func && (lhs: Having, rhs: Having) -> Having {
    return Having(lhs: .clause(lhs), rhs: .clause(rhs), condition: .and)
}

/// Create a `Having` clause using the EXISTS operator.
///
/// - Parameter query: The `Select` query to apply EXISTS on.
/// - Returns: A `Having` containing the clause.
public func exists(_ query: Select) -> Having {
    return Having(rhs: .select(query), condition: .exists)
}

/// Create a `Having` clause using the NOT EXISTS operator.
///
/// - Parameter query: The `Select` query to apply  NOT EXISTS on.
/// - Returns: A `Having` containing the clause.
public func notExists(_ query: Select) -> Having {
    return Having(rhs: .select(query), condition: .notExists)
}

/// Create a `HavingPredicate` using the ANY operator.
///
/// - Parameter query: The `Select` query to apply ANY on.
/// - Returns: A `Predicate<Having, AggregateColumnExpression>` containing the anySubquery.
public func any(_ query: Select) -> Predicate<Having, AggregateColumnExpression> {
    return .anySubquery(query)
}

/// Create a `HavingPredicate` using the ALL operator.
///
/// - Parameter query: The `Select` query to apply ALL on.
/// - Returns: A `Predicate<Having, AggregateColumnExpression>` containing the allSubquery.
public func all(_ query: Select) -> Predicate<Having, AggregateColumnExpression> {
    return .allSubquery(query)
}
