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
public extension String {
    /// Create a `Filter` clause using the like operator.
    ///
    /// - Parameter pattern: The pattern to use in the like expression.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .string(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the like operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the like expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .string(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the notLike operator.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression.
    /// - Returns: A `Filter` containing the clause.
    public func notLike(_ pattern: String) -> Filter {
        return Filter(lhs: .string(self), rhs: .string(pattern), condition: .notLike)
    }

    /// Create a `Filter` clause using the notLike operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func notLike(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .string(self), rhs: .parameter(pattern), condition: .notLike)
    }

    /// Create a `Having` clause using the like operator.
    ///
    /// - Parameter pattern: The pattern to use in the like expression.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: String) -> Having {
        return Having(lhs: .string(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Having` clause using the like operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the like expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: Parameter) -> Having {
        return Having(lhs: .string(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Having` clause using the notLike operator.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression.
    /// - Returns: A `Having` containing the clause.
    public func notLike(_ pattern: String) -> Having {
        return Having(lhs: .string(self), rhs: .string(pattern), condition: .notLike)
    }

    /// Create a `Having` clause using the notLike operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func notLike(_ pattern: Parameter) -> Having {
        return Having(lhs: .string(self), rhs: .parameter(pattern), condition: .notLike)
    }

}
public extension Parameter {
    /// Create a `Filter` clause using the like operator.
    ///
    /// - Parameter pattern: The pattern to use in the like expression.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the like operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the like expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func like(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Filter` clause using the notLike operator.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression.
    /// - Returns: A `Filter` containing the clause.
    public func notLike(_ pattern: String) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .string(pattern), condition: .notLike)
    }

    /// Create a `Filter` clause using the notLike operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression as `Parameter`.
    /// - Returns: A `Filter` containing the clause.
    public func notLike(_ pattern: Parameter) -> Filter {
        return Filter(lhs: .parameter(self), rhs: .parameter(pattern), condition: .notLike)
    }

    /// Create a `Having` clause using the like operator.
    ///
    /// - Parameter pattern: The pattern to use in the like expression.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: String) -> Having {
        return Having(lhs: .parameter(self), rhs: .string(pattern), condition: .like)
    }

    /// Create a `Having` clause using the like operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the like expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func like(_ pattern: Parameter) -> Having {
        return Having(lhs: .parameter(self), rhs: .parameter(pattern), condition: .like)
    }

    /// Create a `Having` clause using the notLike operator.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression.
    /// - Returns: A `Having` containing the clause.
    public func notLike(_ pattern: String) -> Having {
        return Having(lhs: .parameter(self), rhs: .string(pattern), condition: .notLike)
    }

    /// Create a `Having` clause using the notLike operator with `Parameter`.
    ///
    /// - Parameter pattern: The pattern to use in the notLike expression as `Parameter`.
    /// - Returns: A `Having` containing the clause.
    public func notLike(_ pattern: Parameter) -> Having {
        return Having(lhs: .parameter(self), rhs: .parameter(pattern), condition: .notLike)
    }

}
