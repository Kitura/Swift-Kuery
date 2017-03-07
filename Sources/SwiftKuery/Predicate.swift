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

import Foundation

// MARK Predicate

/// An operand of a `ConditionalClause`.
public indirect enum Predicate<ClauseType: Buildable, ColumnExpressionType: Field>: Buildable {
    /// A `Having` or a `Filter` clause.
    case clause(ClauseType)
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
    /// A date.
    case date(Date)
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
    /// An array of Date.
    case arrayOfDate([Date])
    /// A `Column`.
    case column(Column)
    /// An `AggregateColumnExpression` or a `ScalarColumnExpression`.
    case columnExpression(ColumnExpressionType)
    /// A parameter.
    case parameter(Parameter)
    /// An array of Parameter.
    case arrayOfParameter([Parameter])
    /// A `Select` query.
    case select(Select)
    /// ANY applied on a `Select` query.
    case anySubquery(Select)
    /// ALL applied on a `Select` query.
    case allSubquery(Select)
    
    /// Build the having predicate using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the havinh predicate.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        switch self {
        case .clause(let clause):
            return try "(" + clause.build(queryBuilder: queryBuilder) + ")"
        case .string(let string):
            return Utils.packType(string)
        case .int(let value):
            return Utils.packType(value)
        case .float(let value):
            return Utils.packType(value)
        case .double(let value):
            return Utils.packType(value)
        case .bool(let value):
            return try Utils.packType(value, queryBuilder: queryBuilder)
        case .date(let value):
            return Utils.packType(value)
        case .column(let column):
            return try column.build(queryBuilder: queryBuilder)
        case .columnExpression(let columnExpression):
            return try columnExpression.build(queryBuilder: queryBuilder)
        case .parameter(let parameter):
            return try parameter.build(queryBuilder: queryBuilder)
        case .select(let subquery):
            return try "(" + subquery.build(queryBuilder: queryBuilder) + ")"
        case .anySubquery(let subquery):
            if queryBuilder.anyOnSubquerySupported {
                return try "ANY (" + subquery.build(queryBuilder: queryBuilder) + ")"
            }
            throw QueryError.syntaxError("ANY on subquery is not supported. ")
        case .allSubquery(let subquery):
            return try queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.all.rawValue] + " (" + subquery.build(queryBuilder: queryBuilder) + ")"
        default:
            return ""
        }
    }
}
