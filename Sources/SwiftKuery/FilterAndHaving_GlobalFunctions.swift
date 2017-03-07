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
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: String) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .string(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: String, rhs: Column) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Column) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Int) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .int(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Int, rhs: Column) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Float) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Float) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .float(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Float, rhs: Column) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Double) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Double) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .double(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Double, rhs: Column) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Parameter) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Parameter) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .parameter(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Parameter, rhs: Column) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Select) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: String, rhs: Select) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Select) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Int, rhs: Select) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Float, rhs: Select) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Double, rhs: Select) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Parameter, rhs: Select) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Date) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Date
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Date, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Date) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .date(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Date, rhs: Column) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: String) -> Having {
    return Having(lhs: .column(lhs), rhs: .string(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: String, rhs: Column) -> Having {
    return Having(lhs: .string(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Column) -> Having {
    return Having(lhs: .column(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .int(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Int, rhs: Column) -> Having {
    return Having(lhs: .int(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Float) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Float) -> Having {
    return Having(lhs: .column(lhs), rhs: .float(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Float, rhs: Column) -> Having {
    return Having(lhs: .float(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Double) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Double) -> Having {
    return Having(lhs: .column(lhs), rhs: .double(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Double, rhs: Column) -> Having {
    return Having(lhs: .double(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Parameter) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Parameter) -> Having {
    return Having(lhs: .column(lhs), rhs: .parameter(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Parameter, rhs: Column) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Select) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: String, rhs: Select) -> Having {
    return Having(lhs: .string(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Select) -> Having {
    return Having(lhs: .column(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Int, rhs: Select) -> Having {
    return Having(lhs: .int(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Float, rhs: Select) -> Having {
    return Having(lhs: .float(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Double, rhs: Select) -> Having {
    return Having(lhs: .double(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Parameter, rhs: Select) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .select(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Date) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Date
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Date, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Date) -> Having {
    return Having(lhs: .column(lhs), rhs: .date(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Date, rhs: Column) -> Having {
    return Having(lhs: .date(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: String) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .string(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: String, rhs: Column) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Column) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Int) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .int(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Int, rhs: Column) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Float) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Float) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .float(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Float, rhs: Column) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Double) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Double) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .double(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Double, rhs: Column) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Parameter) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Parameter) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .parameter(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Parameter, rhs: Column) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Select) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: String, rhs: Select) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Select) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Int, rhs: Select) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Float, rhs: Select) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Double, rhs: Select) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Parameter, rhs: Select) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Date) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Date
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Date, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Date) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .date(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Date, rhs: Column) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: String) -> Having {
    return Having(lhs: .column(lhs), rhs: .string(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: String, rhs: Column) -> Having {
    return Having(lhs: .string(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Column) -> Having {
    return Having(lhs: .column(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .int(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Int, rhs: Column) -> Having {
    return Having(lhs: .int(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Float) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Float) -> Having {
    return Having(lhs: .column(lhs), rhs: .float(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Float, rhs: Column) -> Having {
    return Having(lhs: .float(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Double) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Double) -> Having {
    return Having(lhs: .column(lhs), rhs: .double(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Double, rhs: Column) -> Having {
    return Having(lhs: .double(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Parameter) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Parameter) -> Having {
    return Having(lhs: .column(lhs), rhs: .parameter(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Parameter, rhs: Column) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Select) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: String, rhs: Select) -> Having {
    return Having(lhs: .string(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Select) -> Having {
    return Having(lhs: .column(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Int, rhs: Select) -> Having {
    return Having(lhs: .int(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Float, rhs: Select) -> Having {
    return Having(lhs: .float(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Double, rhs: Select) -> Having {
    return Having(lhs: .double(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Parameter, rhs: Select) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Date) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Date
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Date, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Date) -> Having {
    return Having(lhs: .column(lhs), rhs: .date(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Date, rhs: Column) -> Having {
    return Having(lhs: .date(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: String) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .string(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: String, rhs: Column) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Column) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Int) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .int(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Int, rhs: Column) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Float) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Float) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .float(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Float, rhs: Column) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Double) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Double) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .double(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Double, rhs: Column) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Parameter) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Parameter) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .parameter(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Parameter, rhs: Column) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Select) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: String, rhs: Select) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Select) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Int, rhs: Select) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Float, rhs: Select) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Double, rhs: Select) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Parameter, rhs: Select) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Date) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Date
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Date, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Date) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .date(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Date, rhs: Column) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: String) -> Having {
    return Having(lhs: .column(lhs), rhs: .string(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: String, rhs: Column) -> Having {
    return Having(lhs: .string(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Column) -> Having {
    return Having(lhs: .column(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .int(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Int, rhs: Column) -> Having {
    return Having(lhs: .int(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Float) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Float) -> Having {
    return Having(lhs: .column(lhs), rhs: .float(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Float, rhs: Column) -> Having {
    return Having(lhs: .float(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Double) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Double) -> Having {
    return Having(lhs: .column(lhs), rhs: .double(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Double, rhs: Column) -> Having {
    return Having(lhs: .double(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Parameter) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Parameter) -> Having {
    return Having(lhs: .column(lhs), rhs: .parameter(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Parameter, rhs: Column) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Select) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: String, rhs: Select) -> Having {
    return Having(lhs: .string(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Select) -> Having {
    return Having(lhs: .column(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Int, rhs: Select) -> Having {
    return Having(lhs: .int(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Float, rhs: Select) -> Having {
    return Having(lhs: .float(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Double, rhs: Select) -> Having {
    return Having(lhs: .double(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Parameter, rhs: Select) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .select(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Date) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Date
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Date, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Date) -> Having {
    return Having(lhs: .column(lhs), rhs: .date(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Date, rhs: Column) -> Having {
    return Having(lhs: .date(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: String) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .string(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: String, rhs: Column) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Column) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Int) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .int(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Int, rhs: Column) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Float) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Float) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .float(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Float, rhs: Column) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Double) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Double) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .double(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Double, rhs: Column) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Parameter) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Parameter) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .parameter(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Parameter, rhs: Column) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Select) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: String, rhs: Select) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Select) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Int, rhs: Select) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Float, rhs: Select) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Double, rhs: Select) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Parameter, rhs: Select) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Date) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Date
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Date, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Date) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .date(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Date, rhs: Column) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: String) -> Having {
    return Having(lhs: .column(lhs), rhs: .string(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: String, rhs: Column) -> Having {
    return Having(lhs: .string(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Column) -> Having {
    return Having(lhs: .column(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .int(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Int, rhs: Column) -> Having {
    return Having(lhs: .int(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Float) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Float) -> Having {
    return Having(lhs: .column(lhs), rhs: .float(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Float, rhs: Column) -> Having {
    return Having(lhs: .float(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Double) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Double) -> Having {
    return Having(lhs: .column(lhs), rhs: .double(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Double, rhs: Column) -> Having {
    return Having(lhs: .double(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Parameter) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Parameter) -> Having {
    return Having(lhs: .column(lhs), rhs: .parameter(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Parameter, rhs: Column) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Select) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: String, rhs: Select) -> Having {
    return Having(lhs: .string(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Select) -> Having {
    return Having(lhs: .column(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Int, rhs: Select) -> Having {
    return Having(lhs: .int(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Float, rhs: Select) -> Having {
    return Having(lhs: .float(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Double, rhs: Select) -> Having {
    return Having(lhs: .double(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Parameter, rhs: Select) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Date) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Date
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Date, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Date) -> Having {
    return Having(lhs: .column(lhs), rhs: .date(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Date, rhs: Column) -> Having {
    return Having(lhs: .date(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: String) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .string(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: String, rhs: Column) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Column) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Int) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .int(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Int, rhs: Column) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Float) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Float) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .float(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Float, rhs: Column) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Double) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Double) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .double(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Double, rhs: Column) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Parameter) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Parameter) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .parameter(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Parameter, rhs: Column) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Select) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: String, rhs: Select) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Select) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Int, rhs: Select) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Float, rhs: Select) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Double, rhs: Select) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Parameter, rhs: Select) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Date) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Date
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Date, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Date) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .date(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Date, rhs: Column) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: String) -> Having {
    return Having(lhs: .column(lhs), rhs: .string(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: String, rhs: Column) -> Having {
    return Having(lhs: .string(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Column) -> Having {
    return Having(lhs: .column(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .int(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Int, rhs: Column) -> Having {
    return Having(lhs: .int(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Float) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Float) -> Having {
    return Having(lhs: .column(lhs), rhs: .float(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Float, rhs: Column) -> Having {
    return Having(lhs: .float(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Double) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Double) -> Having {
    return Having(lhs: .column(lhs), rhs: .double(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Double, rhs: Column) -> Having {
    return Having(lhs: .double(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Parameter) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Parameter) -> Having {
    return Having(lhs: .column(lhs), rhs: .parameter(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Parameter, rhs: Column) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Select) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: String, rhs: Select) -> Having {
    return Having(lhs: .string(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Select) -> Having {
    return Having(lhs: .column(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Int, rhs: Select) -> Having {
    return Having(lhs: .int(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Float, rhs: Select) -> Having {
    return Having(lhs: .float(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Double, rhs: Select) -> Having {
    return Having(lhs: .double(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Parameter, rhs: Select) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .select(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Date) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Date
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Date, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Date) -> Having {
    return Having(lhs: .column(lhs), rhs: .date(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Date, rhs: Column) -> Having {
    return Having(lhs: .date(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: String) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .string(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: String, rhs: Column) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Column) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Int) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .int(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Int, rhs: Column) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Float) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Float) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .float(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Float, rhs: Column) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Double) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Double) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .double(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Double, rhs: Column) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Parameter) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Parameter) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .parameter(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Parameter, rhs: Column) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Select) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: String, rhs: Select) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Select) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Int, rhs: Select) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Float, rhs: Select) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Double, rhs: Select) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Parameter, rhs: Select) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Date) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Date
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Date, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Date) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .date(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Date, rhs: Column) -> Filter {
    return Filter(lhs: .date(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .string(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: String) -> Having {
    return Having(lhs: .column(lhs), rhs: .string(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for String
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: String, rhs: Column) -> Having {
    return Having(lhs: .string(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Column) -> Having {
    return Having(lhs: .column(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .column(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .int(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .int(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Int
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Int, rhs: Column) -> Having {
    return Having(lhs: .int(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Float) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .float(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and Float.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Float) -> Having {
    return Having(lhs: .column(lhs), rhs: .float(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Float
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Float, rhs: Column) -> Having {
    return Having(lhs: .float(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Double) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .double(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and Double.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Double) -> Having {
    return Having(lhs: .column(lhs), rhs: .double(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Double
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Double, rhs: Column) -> Having {
    return Having(lhs: .double(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Parameter) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .parameter(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and Parameter.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Parameter) -> Having {
    return Having(lhs: .column(lhs), rhs: .parameter(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Parameter
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Parameter, rhs: Column) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Select) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for String
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: String, rhs: Select) -> Having {
    return Having(lhs: .string(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Select) -> Having {
    return Having(lhs: .column(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Int
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Int, rhs: Select) -> Having {
    return Having(lhs: .int(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Float
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Float, rhs: Select) -> Having {
    return Having(lhs: .float(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Double
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Double, rhs: Select) -> Having {
    return Having(lhs: .double(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Parameter
/// and Select.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Parameter, rhs: Select) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .select(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Date) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .date(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Date
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Date, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .date(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and Date.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Date) -> Having {
    return Having(lhs: .column(lhs), rhs: .date(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Date
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Date, rhs: Column) -> Having {
    return Having(lhs: .date(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Bool) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .bool(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Bool
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Bool, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Bool) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .bool(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Bool
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Bool, rhs: Column) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Bool) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .bool(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Bool
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Bool, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .bool(lhs), rhs: .columnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Bool) -> Having {
    return Having(lhs: .column(lhs), rhs: .bool(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Bool
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Bool, rhs: Column) -> Having {
    return Having(lhs: .bool(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Bool) -> Filter {
    return Filter(lhs: .columnExpression(lhs), rhs: .bool(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Bool
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Bool, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Bool) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .bool(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Bool
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Bool, rhs: Column) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Bool) -> Having {
    return Having(lhs: .columnExpression(lhs), rhs: .bool(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Bool
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Bool, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .bool(lhs), rhs: .columnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Bool) -> Having {
    return Having(lhs: .column(lhs), rhs: .bool(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Bool
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Bool, rhs: Column) -> Having {
    return Having(lhs: .bool(lhs), rhs: .column(rhs), condition: .notEqual)
}

