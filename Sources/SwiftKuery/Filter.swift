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

// MARK: Filter

/// A condition used in an SQL WHERE or ON clause.
public struct Filter: ConditionalClause, QueryFilterProtocol {
    public typealias ClauseType = Filter
    public typealias ColumnExpressionType = ScalarColumnExpression
    /// The left hand side of the conditional clause.
    public let lhs: Predicate<Filter, ScalarColumnExpression>?
    /// The right hand side of the conditional clause.
    public let rhs: Predicate<Filter, ScalarColumnExpression>?
    /// The operator of the conditional clause.
    public let condition: Condition
    
    init(lhs: Predicate<Filter, ScalarColumnExpression>?=nil, rhs: Predicate<Filter, ScalarColumnExpression>?=nil, condition: Condition) {
        self.lhs = lhs
        self.rhs = rhs
        self.condition = condition
    }
}

// MARK: QueryFilterProtocol

/// Defines the protocol which should be used for all filtering clauses.
/// Represents a filter as String value.
public protocol QueryFilterProtocol: Buildable {
    
}

// MARK Global functions

/// Create a `Filter` clause using the OR operator.
///
/// - Parameter lhs: A `Filter` - the left hand side of the clause.
/// - Parameter rhs: A `Filter` - the right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func || (lhs: Filter, rhs: Filter) -> Filter {
    return Filter(lhs: .clause(lhs), rhs: .clause(rhs), condition: .or)
}

/// Create a `Filter` clause using the AND operator.
///
/// - Parameter lhs: A `Filter` - the left hand side of the clause.
/// - Parameter rhs: A `Filter` - the right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func && (lhs: Filter, rhs: Filter) -> Filter {
    return Filter(lhs: .clause(lhs), rhs: .clause(rhs), condition: .and)
}

/// Create a `Filter` clause using the EXISTS operator.
///
/// - Parameter query: The `Select` query to apply EXISTS on.
/// - Returns: A `Filter` containing the clause.
public func exists(_ query: Select) -> Filter {
    return Filter(rhs: .select(query), condition: .exists)
}

/// Create a `Filter` clause using the NOT EXISTS operator.
///
/// - Parameter query: The `Select` query to apply NOT EXISTS on.
/// - Returns: A `Filter` containing the clause.
public func notExists(_ query: Select) -> Filter {
    return Filter(rhs: .select(query), condition: .notExists)
}

/// Create a `FilterPredicate` using the ANY operator.
///
/// - Parameter query: The `Select` query to apply ANY on.
/// - Returns: A `Predicate<Filter, ScalarColumnExpression>` containing the anySubquery.
public func any(_ query: Select) -> Predicate<Filter, ScalarColumnExpression> {
    return .anySubquery(query)
}

/// Create a `FilterPredicate` using the ALL operator.
///
/// - Parameter query: The `Select` query to apply ALL on.
/// - Returns: A `Predicate<Filter, ScalarColumnExpression>` containing the allSubquery.
public func all(_ query: Select) -> Predicate<Filter, ScalarColumnExpression> {
    return .allSubquery(query)
}

