/**
* Copyright IBM Corporation 2016
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

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .string(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .scalarColumnExpression(rhs), condition: .equal)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .scalarColumnExpression(rhs), condition: .equal)
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
    return Filter(lhs: .column(lhs), rhs: .scalarColumnExpression(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .int(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .scalarColumnExpression(rhs), condition: .equal)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .float(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .scalarColumnExpression(rhs), condition: .equal)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .double(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .scalarColumnExpression(rhs), condition: .equal)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .parameter(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .scalarColumnExpression(rhs), condition: .equal)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .select(rhs), condition: .equal)
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

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .string(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .aggregateColumnExpression(rhs), condition: .equal)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .aggregateColumnExpression(rhs), condition: .equal)
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
    return Having(lhs: .column(lhs), rhs: .aggregateColumnExpression(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .column(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .int(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .aggregateColumnExpression(rhs), condition: .equal)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .float(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .aggregateColumnExpression(rhs), condition: .equal)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .double(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .aggregateColumnExpression(rhs), condition: .equal)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .parameter(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .aggregateColumnExpression(rhs), condition: .equal)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .select(rhs), condition: .equal)
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

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .string(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Filter(lhs: .column(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .int(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .float(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .double(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .parameter(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
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

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .string(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Having(lhs: .column(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .column(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .int(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .float(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .double(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .parameter(rhs), condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .select(rhs), condition: .greaterThanOrEqual)
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

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .string(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThan)
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
    return Filter(lhs: .column(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .int(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .float(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .double(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .parameter(rhs), condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .scalarColumnExpression(rhs), condition: .greaterThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .select(rhs), condition: .greaterThan)
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

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .string(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThan)
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
    return Having(lhs: .column(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .column(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .int(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .float(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .double(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .parameter(rhs), condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .aggregateColumnExpression(rhs), condition: .greaterThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .select(rhs), condition: .greaterThan)
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

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .string(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Filter(lhs: .column(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .int(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .float(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .double(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .parameter(rhs), condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
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

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .string(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Having(lhs: .column(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .column(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .int(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .float(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .double(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .parameter(rhs), condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThanOrEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .select(rhs), condition: .lessThanOrEqual)
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

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .string(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThan)
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
    return Filter(lhs: .column(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .int(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .float(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .double(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .parameter(rhs), condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .scalarColumnExpression(rhs), condition: .lessThan)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .select(rhs), condition: .lessThan)
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

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .string(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThan)
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
    return Having(lhs: .column(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .column(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .int(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .float(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .double(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .parameter(rhs), condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .aggregateColumnExpression(rhs), condition: .lessThan)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .select(rhs), condition: .lessThan)
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

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .string(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for String
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: String, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .string(lhs), rhs: .scalarColumnExpression(rhs), condition: .notEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .scalarColumnExpression(rhs), condition: .notEqual)
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
    return Filter(lhs: .column(lhs), rhs: .scalarColumnExpression(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Column) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .int(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Int
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Int, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .int(lhs), rhs: .scalarColumnExpression(rhs), condition: .notEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .float(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Float
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Float, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .float(lhs), rhs: .scalarColumnExpression(rhs), condition: .notEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .double(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Double
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Double, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .double(lhs), rhs: .scalarColumnExpression(rhs), condition: .notEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .parameter(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Parameter
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Parameter, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: .scalarColumnExpression(rhs), condition: .notEqual)
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
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .select(rhs), condition: .notEqual)
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

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and String.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .string(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for String
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: String, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .string(lhs), rhs: .aggregateColumnExpression(rhs), condition: .notEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .aggregateColumnExpression(rhs), condition: .notEqual)
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
    return Having(lhs: .column(lhs), rhs: .aggregateColumnExpression(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Column.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Column) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .column(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Int.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .int(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Int
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Int, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .int(lhs), rhs: .aggregateColumnExpression(rhs), condition: .notEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .float(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Float
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Float, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .float(lhs), rhs: .aggregateColumnExpression(rhs), condition: .notEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .double(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Double
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Double, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .double(lhs), rhs: .aggregateColumnExpression(rhs), condition: .notEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .parameter(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Parameter
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Parameter, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .parameter(lhs), rhs: .aggregateColumnExpression(rhs), condition: .notEqual)
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
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .select(rhs), condition: .notEqual)
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

/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Bool) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .bool(rhs), condition: .equal)
}

/// Create a `Filter` clause using the operator == for Bool
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Bool, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: .scalarColumnExpression(rhs), condition: .equal)
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

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Bool) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .bool(rhs), condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Bool
/// and ScalarColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Bool, rhs: ScalarColumnExpression) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: .scalarColumnExpression(rhs), condition: .notEqual)
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

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Bool) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .bool(rhs), condition: .equal)
}

/// Create a `Having` clause using the operator == for Bool
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Bool, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .bool(lhs), rhs: .aggregateColumnExpression(rhs), condition: .equal)
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

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and Bool.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Bool) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .bool(rhs), condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Bool
/// and AggregateColumnExpression.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Bool, rhs: AggregateColumnExpression) -> Having {
    return Having(lhs: .bool(lhs), rhs: .aggregateColumnExpression(rhs), condition: .notEqual)
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

public extension ScalarColumnExpression {
    /// Create a `Filter` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the LIKE operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .parameter(pattern), condition: .like)
    }


    /// Create a `Filter` clause using the BETWEEN operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfBool(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Bool.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Bool...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfBool(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Bool.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Bool...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfBool(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for String.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfString(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for String.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for String.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: String...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfString(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for String.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: String...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfString(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for Int.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfInt(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Int.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Int.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Int...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfInt(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Int.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Int...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfInt(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for Float.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfFloat(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Float.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Float.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Float...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfFloat(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Float.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Float...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for Double.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfDouble(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Double.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Double.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Double...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfDouble(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Double.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Double...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Parameter.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfParameter(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Parameter.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }
}
public extension Column {
    /// Create a `Filter` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .column(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the LIKE operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .column(self), rhs: .parameter(pattern), condition: .like)
    }


    /// Create a `Filter` clause using the BETWEEN operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfBool(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Bool.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Bool...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfBool(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Bool.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Bool...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfBool(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for String.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfString(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for String.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for String.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: String...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfString(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for String.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: String...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfString(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for Int.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfInt(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Int.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Int.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Int...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfInt(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Int.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Int...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfInt(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for Float.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfFloat(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Float.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Float.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Float...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfFloat(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Float.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Float...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for Double.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfDouble(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Double.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Double.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Double...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfDouble(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Double.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Double...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the BETWEEN operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Filter` clause using the NOT BETWEEN operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the IN operator for Parameter.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfParameter(values), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for Parameter.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }
}
public extension AggregateColumnExpression {
    /// Create a `Having` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: String) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Having` clause using the LIKE operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: Parameter) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .parameter(pattern), condition: .like)
    }


    /// Create a `Having` clause using the BETWEEN operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfBool(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Bool.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Bool...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfBool(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Bool.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Bool...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfBool(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for String.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfString(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for String.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for String.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: String...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfString(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for String.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: String...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfString(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for Int.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfInt(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Int.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Int.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Int...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfInt(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Int.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Int...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfInt(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for Float.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfFloat(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Float.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Float.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Float...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfFloat(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Float.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Float...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for Double.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfDouble(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Double.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Double.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Double...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfDouble(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Double.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Double...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Parameter.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfParameter(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Parameter.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }
}
public extension Column {
    /// Create a `Having` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: String) -> Having {
        return Having(lhs: .column(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Having` clause using the LIKE operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: Parameter) -> Having {
        return Having(lhs: .column(self), rhs: .parameter(pattern), condition: .like)
    }


    /// Create a `Having` clause using the BETWEEN operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfBool(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Bool.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Bool...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfBool(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Bool.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Bool...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfBool(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for String.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfString(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for String.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for String.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: String...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfString(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for String.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: String...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfString(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for Int.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfInt(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Int.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Int.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Int...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfInt(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Int.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Int...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfInt(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for Float.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfFloat(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Float.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Float.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Float...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfFloat(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Float.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Float...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for Double.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfDouble(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Double.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Double.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Double...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfDouble(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Double.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Double...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }

    /// Create a `Having` clause using the BETWEEN operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the BETWEEN expression.
    /// - Parameter and value2: The right hand side of the BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Having` clause using the NOT BETWEEN operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the NOT BETWEEN expression.
    /// - Parameter and value2: The right hand side of the NOT BETWEEN expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the IN operator for Parameter.
    ///
    /// - Parameter values: The list of values for the IN expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfParameter(values), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for Parameter.
    ///
    /// - Parameter values: The list of values for the NOT IN expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }
}
/// Create a `Filter` clause using the operator == for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: ScalarColumnExpression, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: String, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Column, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Int, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Float, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Double, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Parameter, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator == for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func ==(lhs: Bool, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: AggregateColumnExpression, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: String, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Column, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Int, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Float, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Double, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Parameter, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Having` clause using the operator == for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func ==(lhs: Bool, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .equal)
}

/// Create a `Filter` clause using the operator >= for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: ScalarColumnExpression, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: String, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Column, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Int, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Float, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Double, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Parameter, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator >= for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >=(lhs: Bool, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: AggregateColumnExpression, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: String, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Column, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Int, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Float, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Double, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Parameter, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Having` clause using the operator >= for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >=(lhs: Bool, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .greaterThanOrEqual)
}

/// Create a `Filter` clause using the operator > for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: ScalarColumnExpression, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: String, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Column, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Int, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Float, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Double, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Parameter, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator > for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func >(lhs: Bool, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: AggregateColumnExpression, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: String, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Column, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Int, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Float, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Double, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Parameter, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Having` clause using the operator > for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func >(lhs: Bool, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .greaterThan)
}

/// Create a `Filter` clause using the operator <= for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: ScalarColumnExpression, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: String, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Column, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Int, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Float, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Double, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Parameter, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator <= for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <=(lhs: Bool, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: AggregateColumnExpression, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: String, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Column, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Int, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Float, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Double, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Parameter, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Having` clause using the operator <= for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <=(lhs: Bool, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .lessThanOrEqual)
}

/// Create a `Filter` clause using the operator < for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: ScalarColumnExpression, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: String, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Column, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Int, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Float, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Double, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Parameter, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator < for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func <(lhs: Bool, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: AggregateColumnExpression, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: String, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Column, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Int, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Float, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Double, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Parameter, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Having` clause using the operator < for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func <(lhs: Bool, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .lessThan)
}

/// Create a `Filter` clause using the operator != for ScalarColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: ScalarColumnExpression, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: String, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .string(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Column, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .column(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Int, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .int(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Float, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .float(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Double, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .double(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Parameter, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .parameter(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Filter` clause using the operator != for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Filter` containing the clause.
public func !=(lhs: Bool, rhs: Filter.FilterPredicate) -> Filter {
    return Filter(lhs: .bool(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for AggregateColumnExpression
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: AggregateColumnExpression, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for String
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: String, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .string(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Column
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Column, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .column(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Int
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Int, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .int(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Float
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Float, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .float(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Double
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Double, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .double(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Parameter
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Parameter, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .parameter(lhs), rhs: rhs, condition: .notEqual)
}

/// Create a `Having` clause using the operator != for Bool
/// and subquery.
///
/// - Parameter lhs: The left hand side of the clause.
/// - Parameter rhs: The right hand side of the clause.
/// - Returns: A `Having` containing the clause.
public func !=(lhs: Bool, rhs: Having.HavingPredicate) -> Having {
    return Having(lhs: .bool(lhs), rhs: rhs, condition: .notEqual)
}

public extension Bool {

    /// Create a `Filter` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Bool...) -> Filter {
        return Filter(lhs: .bool(self), rhs: .arrayOfBool(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return Filter(lhs: .bool(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Bool...) -> Filter {
        return Filter(lhs: .bool(self), rhs: .arrayOfBool(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return Filter(lhs: .bool(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .bool(self), rhs: .arrayOfBool(array), condition: .between)
    }

    /// Create a `Filter` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .bool(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Filter` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .bool(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .bool(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Bool...) -> Having {
        return Having(lhs: .bool(self), rhs: .arrayOfBool(values), condition: .`in`)
    }

    /// Create a `Having` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return Having(lhs: .bool(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Bool...) -> Having {
        return Having(lhs: .bool(self), rhs: .arrayOfBool(values), condition: .notIn)
    }

    /// Create a `Having` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return Having(lhs: .bool(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Having` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .bool(self), rhs: .arrayOfBool(array), condition: .between)
    }

    /// Create a `Having` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .bool(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Having` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .bool(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .bool(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }
}
public extension String {

    /// Create a `Filter` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: String...) -> Filter {
        return Filter(lhs: .string(self), rhs: .arrayOfString(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return Filter(lhs: .string(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: String...) -> Filter {
        return Filter(lhs: .string(self), rhs: .arrayOfString(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return Filter(lhs: .string(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .string(self), rhs: .arrayOfString(array), condition: .between)
    }

    /// Create a `Filter` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .string(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Filter` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .string(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .string(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: String...) -> Having {
        return Having(lhs: .string(self), rhs: .arrayOfString(values), condition: .`in`)
    }

    /// Create a `Having` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return Having(lhs: .string(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: String...) -> Having {
        return Having(lhs: .string(self), rhs: .arrayOfString(values), condition: .notIn)
    }

    /// Create a `Having` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return Having(lhs: .string(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Having` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .string(self), rhs: .arrayOfString(array), condition: .between)
    }

    /// Create a `Having` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .string(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Having` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .string(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .string(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }
}
public extension Int {

    /// Create a `Filter` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Int...) -> Filter {
        return Filter(lhs: .int(self), rhs: .arrayOfInt(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return Filter(lhs: .int(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Int...) -> Filter {
        return Filter(lhs: .int(self), rhs: .arrayOfInt(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return Filter(lhs: .int(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .int(self), rhs: .arrayOfInt(array), condition: .between)
    }

    /// Create a `Filter` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .int(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Filter` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .int(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .int(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Int...) -> Having {
        return Having(lhs: .int(self), rhs: .arrayOfInt(values), condition: .`in`)
    }

    /// Create a `Having` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return Having(lhs: .int(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Int...) -> Having {
        return Having(lhs: .int(self), rhs: .arrayOfInt(values), condition: .notIn)
    }

    /// Create a `Having` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return Having(lhs: .int(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Having` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .int(self), rhs: .arrayOfInt(array), condition: .between)
    }

    /// Create a `Having` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .int(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Having` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .int(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .int(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }
}
public extension Float {

    /// Create a `Filter` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Float...) -> Filter {
        return Filter(lhs: .float(self), rhs: .arrayOfFloat(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return Filter(lhs: .float(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Float...) -> Filter {
        return Filter(lhs: .float(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return Filter(lhs: .float(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .float(self), rhs: .arrayOfFloat(array), condition: .between)
    }

    /// Create a `Filter` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .float(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Filter` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .float(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .float(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Float...) -> Having {
        return Having(lhs: .float(self), rhs: .arrayOfFloat(values), condition: .`in`)
    }

    /// Create a `Having` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return Having(lhs: .float(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Float...) -> Having {
        return Having(lhs: .float(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }

    /// Create a `Having` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return Having(lhs: .float(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Having` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .float(self), rhs: .arrayOfFloat(array), condition: .between)
    }

    /// Create a `Having` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .float(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Having` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .float(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .float(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }
}
public extension Double {

    /// Create a `Filter` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Double...) -> Filter {
        return Filter(lhs: .double(self), rhs: .arrayOfDouble(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return Filter(lhs: .double(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Double...) -> Filter {
        return Filter(lhs: .double(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return Filter(lhs: .double(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .double(self), rhs: .arrayOfDouble(array), condition: .between)
    }

    /// Create a `Filter` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .double(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Filter` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .double(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .double(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Double...) -> Having {
        return Having(lhs: .double(self), rhs: .arrayOfDouble(values), condition: .`in`)
    }

    /// Create a `Having` clause using the `in` operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return Having(lhs: .double(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Double...) -> Having {
        return Having(lhs: .double(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }

    /// Create a `Having` clause using the notIn operator and `Parameter`.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return Having(lhs: .double(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Having` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .double(self), rhs: .arrayOfDouble(array), condition: .between)
    }

    /// Create a `Having` clause using the between operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .double(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Having` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .double(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the notBetween operator  and `Parameter`.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .double(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }
}
public extension Parameter {

    /// Create a `Filter` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .parameter(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Filter` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .parameter(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return Having(lhs: .parameter(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return Having(lhs: .parameter(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }

    /// Create a `Having` clause using the between operator.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .parameter(self), rhs: .arrayOfParameter(array), condition: .between)
    }

    /// Create a `Having` clause using the notBetween operator.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .parameter(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }
}
public extension ScalarColumnExpression {

    /// Create a `Filter` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .select(query), condition: .notIn)
    }
}
public extension String {

    /// Create a `Filter` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .string(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .string(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Column {

    /// Create a `Filter` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .column(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .column(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Int {

    /// Create a `Filter` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .int(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .int(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Float {

    /// Create a `Filter` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .float(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .float(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Double {

    /// Create a `Filter` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .double(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .double(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Parameter {

    /// Create a `Filter` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Bool {

    /// Create a `Filter` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ query: Select) -> Filter {
        return Filter(lhs: .bool(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Filter` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ query: Select) -> Filter {
        return Filter(lhs: .bool(self), rhs: .select(query), condition: .notIn)
    }
}
public extension AggregateColumnExpression {

    /// Create a `Having` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .aggregateColumnExpression(self), rhs: .select(query), condition: .notIn)
    }
}
public extension String {

    /// Create a `Having` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .string(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .string(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Column {

    /// Create a `Having` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .column(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .column(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Int {

    /// Create a `Having` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .int(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .int(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Float {

    /// Create a `Having` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .float(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .float(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Double {

    /// Create a `Having` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .double(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .double(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Parameter {

    /// Create a `Having` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .parameter(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .parameter(self), rhs: .select(query), condition: .notIn)
    }
}
public extension Bool {

    /// Create a `Having` clause using the IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ query: Select) -> Having {
        return Having(lhs: .bool(self), rhs: .select(query), condition: .in)
    }

    /// Create a `Having` clause using the NOT IN operator for subquery.
    ///
    /// - Parameter query: The subquery.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ query: Select) -> Having {
        return Having(lhs: .bool(self), rhs: .select(query), condition: .notIn)
    }
}
public extension String {
    /// Create a `Filter` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .string(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the LIKE operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .string(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Having` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: String) -> Having {
        return Having(lhs: .string(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Having` clause using the LIKE operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: Parameter) -> Having {
        return Having(lhs: .string(self), rhs: .parameter(pattern), condition: .like)
    }

}
public extension Parameter {
    /// Create a `Filter` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the LIKE operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Having` clause using the LIKE operator.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: String) -> Having {
        return Having(lhs: .parameter(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Having` clause using the LIKE operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the LIKE expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: Parameter) -> Having {
        return Having(lhs: .parameter(self), rhs: .parameter(pattern), condition: .like)
    }

}
