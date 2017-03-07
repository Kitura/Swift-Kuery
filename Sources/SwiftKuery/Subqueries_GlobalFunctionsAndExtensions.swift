/**
* Copyright IBM Corporation 2016, 2017
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

import Foundation

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: String, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Int, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Float, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Double, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Parameter, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Bool, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: String, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Int, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Float, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Double, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Parameter, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Bool, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: String, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Int, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Float, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Double, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Parameter, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Bool, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: String, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Int, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Float, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Double, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Parameter, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Bool, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: String, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Int, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Float, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Double, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Parameter, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Bool, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: String, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Int, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Float, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Double, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Parameter, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Bool, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: String, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Int, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Float, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Double, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Parameter, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Bool, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: String, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Int, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Float, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Double, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Parameter, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Bool, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: String, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Int, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Float, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Double, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Parameter, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Bool, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: String, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Int, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Float, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Double, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Parameter, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Bool, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: String, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Int, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Float, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Double, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Parameter, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Bool, rhs: Predicate<Filter,ScalarColumnExpression>) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: String, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Int, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Float, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Double, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Parameter, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Bool, rhs: Predicate<Having,AggregateColumnExpression>) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .notEqual)
}

public extension ScalarColumnExpression {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .select(query), condition: .notIn)
    }
}
public extension String {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .string(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .string(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Column {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .column(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .column(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Int {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .int(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .int(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Float {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .float(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .float(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Double {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .double(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .double(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Parameter {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Bool {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .bool(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .bool(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Date {

    /// Create a `Filter` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .date(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .date(self), rhs: .select(query), condition: .notIn)
    }
}
public extension AggregateColumnExpression {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .select(query), condition: .notIn)
    }
}
public extension String {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .string(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .string(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Column {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .column(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .column(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Int {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .int(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .int(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Float {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .float(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .float(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Double {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .double(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .double(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Parameter {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .parameter(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .parameter(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Bool {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .bool(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .bool(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Date {

    /// Create a `Having` clause using the `in` operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .date(self), rhs: .select(query), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .date(self), rhs: .select(query), condition: .notIn)
    }
}
