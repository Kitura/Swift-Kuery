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


public extension ScalarColumnExpression {
    /// Create a `Filter` clause using the like operator.
    ///
    /// - Parameter pattern: The pattern to use in the like expression.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the like operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the like expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the notLike operator.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression.
    /// - Returns: A `Filter` containing the clause.
    public func notLike(_ pattern: String) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .string(pattern), condition: .notLike)
    }

    /// Create a `Filter` clause using the notLike operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func notLike(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .parameter(pattern), condition: .notLike)
    }

    /// Create a `Filter` clause using the between operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfBool(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Bool.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Bool...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Bool.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Bool]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfBool(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Bool.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Bool...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Bool.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Bool]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfBool(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for String.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfString(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for String.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for String.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: String...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for String.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [String]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfString(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for String.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: String...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for String.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [String]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfString(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Int.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfInt(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Int.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Int.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Int...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Int.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Int]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfInt(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Int.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Int...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Int.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Int]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfInt(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Float.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfFloat(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Float.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Float.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Float...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Float.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Float]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfFloat(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Float.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Float...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Float.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Float]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Double.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfDouble(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Double.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Double.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Double...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Double.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Double]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfDouble(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Double.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Double...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Double.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Double]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfParameter(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Parameter.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Parameter.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Parameter]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Parameter.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Parameter.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Parameter]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Date.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Date, and value2: Date) -> Filter {
        var array = [Date]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfDate(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Date.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Date, and value2: Date) -> Filter {
        var array = [Date]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfDate(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Date.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Date...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Date.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Date]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfDate(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Date.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Date...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Date.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Date]) -> Filter {
        return Filter(lhs: .columnExpression(self), rhs: .arrayOfDate(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the isNull operator.
    ///
    /// - Returns: A `Filter` containing the clause.
    public func isNull() -> Filter {
        return Filter(lhs: .columnExpression(self), condition: .isNull)
    }


    /// Create a `Filter` clause using the isNotNull operator.
    ///
    /// - Returns: A `Filter` containing the clause.
    public func isNotNull() -> Filter {
        return Filter(lhs: .columnExpression(self), condition: .isNotNull)
    }

}

public extension Column {
    /// Create a `Filter` clause using the like operator.
    ///
    /// - Parameter pattern: The pattern to use in the like expression.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .column(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the like operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the like expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .column(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the notLike operator.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression.
    /// - Returns: A `Filter` containing the clause.
    public func notLike(_ pattern: String) -> Filter {
        return Filter(lhs: .column(self), rhs: .string(pattern), condition: .notLike)
    }

    /// Create a `Filter` clause using the notLike operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func notLike(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .column(self), rhs: .parameter(pattern), condition: .notLike)
    }

    /// Create a `Filter` clause using the between operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfBool(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Filter {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Bool.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Bool...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Bool.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Bool]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfBool(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Bool.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Bool...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Bool.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Bool]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfBool(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for String.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfString(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for String.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Filter {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for String.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: String...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for String.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [String]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfString(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for String.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: String...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for String.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [String]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfString(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Int.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfInt(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Int.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Filter {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Int.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Int...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Int.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Int]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfInt(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Int.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Int...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Int.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Int]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfInt(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Float.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfFloat(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Float.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Filter {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Float.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Float...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Float.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Float]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfFloat(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Float.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Float...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Float.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Float]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Double.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfDouble(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Double.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Filter {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Double.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Double...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Double.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Double]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfDouble(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Double.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Double...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Double.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Double]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfParameter(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Filter {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Parameter.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Parameter...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Parameter.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Parameter]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Parameter.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Parameter...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Parameter.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Parameter]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }
    /// Create a `Filter` clause using the between operator for Date.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Filter` containing the clause.
    public func between(_ value1: Date, and value2: Date) -> Filter {
        var array = [Date]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfDate(array), condition: .between)
    }
    /// Create a `Filter` clause using the notBetween operator for Date.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Filter` containing the clause.
    public func notBetween(_ value1: Date, and value2: Date) -> Filter {
        var array = [Date]()
        array.append(value1)
        array.append(value2)
        return Filter(lhs: .column(self), rhs: .arrayOfDate(array), condition: .notBetween)
    }

    /// Create a `Filter` clause using the `in` operator for Date.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: Date...) -> Filter {
        return `in`(values)
    }

    /// Create a `Filter` clause using the `in` operator for Date.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Filter` containing the clause.
    public func `in`(_ values: [Date]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfDate(values), condition: .`in`)
    }

    /// Create a `Filter` clause using the notIn operator for Date.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: Date...) -> Filter {
        return notIn(values)
    }

    /// Create a `Filter` clause using the notIn operator for Date.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Filter` containing the clause.
    public func notIn(_ values: [Date]) -> Filter {
        return Filter(lhs: .column(self), rhs: .arrayOfDate(values), condition: .notIn)
    }

    /// Create a `Filter` clause using the isNull operator.
    ///
    /// - Returns: A `Filter` containing the clause.
    public func isNull() -> Filter {
        return Filter(lhs: .column(self), condition: .isNull)
    }


    /// Create a `Filter` clause using the isNotNull operator.
    ///
    /// - Returns: A `Filter` containing the clause.
    public func isNotNull() -> Filter {
        return Filter(lhs: .column(self), condition: .isNotNull)
    }

}

public extension AggregateColumnExpression {
    /// Create a `Having` clause using the like operator.
    ///
    /// - Parameter pattern: The pattern to use in the like expression.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: String) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Having` clause using the like operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the like expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: Parameter) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Having` clause using the notLike operator.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression.
    /// - Returns: A `Having` containing the clause.
    public func notLike(_ pattern: String) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .string(pattern), condition: .notLike)
    }

    /// Create a `Having` clause using the notLike operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func notLike(_ pattern: Parameter) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .parameter(pattern), condition: .notLike)
    }

    /// Create a `Having` clause using the between operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfBool(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Bool.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Bool...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Bool.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Bool]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfBool(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Bool.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Bool...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Bool.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Bool]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfBool(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for String.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfString(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for String.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for String.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: String...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for String.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [String]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfString(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for String.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: String...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for String.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [String]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfString(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Int.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfInt(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Int.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Int.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Int...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Int.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Int]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfInt(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Int.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Int...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Int.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Int]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfInt(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Float.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfFloat(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Float.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Float.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Float...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Float.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Float]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfFloat(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Float.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Float...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Float.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Float]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Double.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfDouble(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Double.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Double.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Double...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Double.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Double]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfDouble(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Double.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Double...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Double.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Double]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfParameter(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Parameter.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Parameter.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Parameter]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Parameter.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Parameter.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Parameter]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Date.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Date, and value2: Date) -> Having {
        var array = [Date]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfDate(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Date.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Date, and value2: Date) -> Having {
        var array = [Date]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .columnExpression(self), rhs: .arrayOfDate(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Date.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Date...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Date.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Date]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfDate(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Date.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Date...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Date.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Date]) -> Having {
        return Having(lhs: .columnExpression(self), rhs: .arrayOfDate(values), condition: .notIn)
    }

    /// Create a `Having` clause using the isNull operator.
    ///
    /// - Returns: A `Having` containing the clause.
    public func isNull() -> Having {
        return Having(lhs: .columnExpression(self), condition: .isNull)
    }


    /// Create a `Having` clause using the isNotNull operator.
    ///
    /// - Returns: A `Having` containing the clause.
    public func isNotNull() -> Having {
        return Having(lhs: .columnExpression(self), condition: .isNotNull)
    }

}

public extension Column {
    /// Create a `Having` clause using the like operator.
    ///
    /// - Parameter pattern: The pattern to use in the like expression.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: String) -> Having {
        return Having(lhs: .column(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Having` clause using the like operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the like expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: Parameter) -> Having {
        return Having(lhs: .column(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Having` clause using the notLike operator.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression.
    /// - Returns: A `Having` containing the clause.
    public func notLike(_ pattern: String) -> Having {
        return Having(lhs: .column(self), rhs: .string(pattern), condition: .notLike)
    }

    /// Create a `Having` clause using the notLike operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func notLike(_ pattern: Parameter) -> Having {
        return Having(lhs: .column(self), rhs: .parameter(pattern), condition: .notLike)
    }

    /// Create a `Having` clause using the between operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfBool(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Bool.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Bool, and value2: Bool) -> Having {
        var array = [Bool]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfBool(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Bool.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Bool...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Bool.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Bool]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfBool(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Bool.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Bool...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Bool.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Bool]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfBool(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for String.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfString(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for String.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: String, and value2: String) -> Having {
        var array = [String]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfString(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for String.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: String...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for String.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [String]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfString(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for String.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: String...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for String.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [String]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfString(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Int.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfInt(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Int.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Int, and value2: Int) -> Having {
        var array = [Int]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfInt(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Int.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Int...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Int.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Int]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfInt(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Int.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Int...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Int.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Int]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfInt(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Float.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfFloat(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Float.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Float, and value2: Float) -> Having {
        var array = [Float]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfFloat(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Float.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Float...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Float.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Float]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfFloat(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Float.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Float...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Float.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Float]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfFloat(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Double.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfDouble(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Double.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Double, and value2: Double) -> Having {
        var array = [Double]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfDouble(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Double.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Double...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Double.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Double]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfDouble(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Double.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Double...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Double.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Double]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfDouble(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfParameter(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Parameter.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Parameter, and value2: Parameter) -> Having {
        var array = [Parameter]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfParameter(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Parameter.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Parameter...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Parameter.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Parameter]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfParameter(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Parameter.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Parameter...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Parameter.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Parameter]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfParameter(values), condition: .notIn)
    }
    /// Create a `Having` clause using the between operator for Date.
    ///
    /// - Parameter value1: The left hand side of the between expression.
    /// - Parameter and value2: The right hand side of the between expression.
    /// - Returns: A `Having` containing the clause.
    public func between(_ value1: Date, and value2: Date) -> Having {
        var array = [Date]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfDate(array), condition: .between)
    }
    /// Create a `Having` clause using the notBetween operator for Date.
    ///
    /// - Parameter value1: The left hand side of the notBetween expression.
    /// - Parameter and value2: The right hand side of the notBetween expression.
    /// - Returns: A `Having` containing the clause.
    public func notBetween(_ value1: Date, and value2: Date) -> Having {
        var array = [Date]()
        array.append(value1)
        array.append(value2)
        return Having(lhs: .column(self), rhs: .arrayOfDate(array), condition: .notBetween)
    }

    /// Create a `Having` clause using the `in` operator for Date.
    ///
    /// - Parameter values: The list of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: Date...) -> Having {
        return `in`(values)
    }

    /// Create a `Having` clause using the `in` operator for Date.
    ///
    /// - Parameter values: An array of values for the `in` expression.
    /// - Returns: A `Having` containing the clause.
    public func `in`(_ values: [Date]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfDate(values), condition: .`in`)
    }

    /// Create a `Having` clause using the notIn operator for Date.
    ///
    /// - Parameter values: The list of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: Date...) -> Having {
        return notIn(values)
    }

    /// Create a `Having` clause using the notIn operator for Date.
    ///
    /// - Parameter values: An array of values for the notIn expression.
    /// - Returns: A `Having` containing the clause.
    public func notIn(_ values: [Date]) -> Having {
        return Having(lhs: .column(self), rhs: .arrayOfDate(values), condition: .notIn)
    }

    /// Create a `Having` clause using the isNull operator.
    ///
    /// - Returns: A `Having` containing the clause.
    public func isNull() -> Having {
        return Having(lhs: .column(self), condition: .isNull)
    }


    /// Create a `Having` clause using the isNotNull operator.
    ///
    /// - Returns: A `Having` containing the clause.
    public func isNotNull() -> Having {
        return Having(lhs: .column(self), condition: .isNotNull)
    }

}
