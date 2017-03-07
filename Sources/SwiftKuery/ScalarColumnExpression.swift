/**
 Copyright IBM Corporation 2016, 2017
 
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

// MARK: ScalarColumnExpression

/// An expression containing a scalar function applied on a column.
public struct ScalarColumnExpression: Field {
    
    /// The alias of the field.
    public var alias: String?
    
    /// The scalar function to apply.
    public private (set) var function: ScalarFunction
        
    init(_ function: ScalarFunction) {
        self.function = function
    }

    /// Build the query component using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query component.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        var result = try function.build(queryBuilder: queryBuilder)
        if let alias = alias {
            result += " AS " + Utils.packName(alias, queryBuilder: queryBuilder)
        }
        return result
    }

    /// An enumeration of the supported scalar functions that can applied on a column.
    public enum ScalarFunction: Buildable {
        /// The SQL NOW function.
        case now()
        /// The SQL UCASE function.
        case ucase(field: Field)
        /// The SQL LCASE function.
        case lcase(field: Field)
        /// The SQL ROUND function.
        case round(field: Field, to: Int)
        /// The SQL MID function.
        case mid(field: Field, start: Int, length: Int)
        /// The SQL LEN function.
        case len(field: Field)

        /// Build the query component using `QueryBuilder`.
        ///
        /// - Parameter queryBuilder: The QueryBuilder to use.
        /// - Returns: A String representation of the query component.
        /// - Throws: QueryError.syntaxError if query build fails.
        public func build(queryBuilder: QueryBuilder) throws -> String {
            switch self {
            case .now:
                return queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.now.rawValue]
            case .ucase(let field):
                return try queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.ucase.rawValue] + "(" + field.build(queryBuilder: queryBuilder) + ")"
            case .lcase(let field):
                return try queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.lcase.rawValue] + "(" + field.build(queryBuilder: queryBuilder) + ")"
            case .round(let field, let decimal):
                return try "ROUND(" + field.build(queryBuilder: queryBuilder) + ", \(decimal))"
            case .mid(let field, let start, let length):
                return try "MID(" + field.build(queryBuilder: queryBuilder) + ", \(start), \(length))"
            case .len(let field):
                return try "LEN(" + field.build(queryBuilder: queryBuilder) + ")"
            }
        }
    }    
}

// MARK Global functions

/// Create a `ScalarColumnExpression` using the NOW function.
///
/// - Returns: An instance of `ScalarColumnExpression`.
public func now() -> ScalarColumnExpression {
    return ScalarColumnExpression(.now())
}

/// Create a `ScalarColumnExpression` using the LEN function.
///
/// - Parameter field: The `ScalarColumnExpression` to apply the function on.
/// - Returns: An instance of `ScalarColumnExpression`.
public func len(_ field: ScalarColumnExpression) -> ScalarColumnExpression {
    return ScalarColumnExpression(.len(field: field))
}

/// Create a `ScalarColumnExpression` using the UCASE function.
///
/// - Parameter field: The `ScalarColumnExpression` to apply the function on.
/// - Returns: An instance of `ScalarColumnExpression`.
public func ucase(_ field: ScalarColumnExpression) -> ScalarColumnExpression {
    return ScalarColumnExpression(.ucase(field: field))
}

/// Create a `ScalarColumnExpression` using the LCASE function.
///
/// - Parameter field: The `ScalarColumnExpression` to apply the function on.
/// - Returns: An instance of `ScalarColumnExpression`.
public func lcase(_ field: ScalarColumnExpression) -> ScalarColumnExpression {
    return ScalarColumnExpression(.lcase(field: field))
}

/// Create a `ScalarColumnExpression` using the ROUND function.
///
/// - Parameter field: The `ScalarColumnExpression` to apply the function on.
/// - Parameter to: The decimal to round the values to.
/// - Returns: An instance of `ScalarColumnExpression`.
public func round(_ field: ScalarColumnExpression, to decimal: Int) -> ScalarColumnExpression {
    return ScalarColumnExpression(.round(field: field, to: decimal))
}

/// Create a `ScalarColumnExpression` using the MID function.
///
/// - Parameter field: The `ScalarColumnExpression` to apply the function on.
/// - Parameter start: The starting position for the text extraction.
/// - Parameter length: The number of characters to return.
/// - Returns: An instance of `ScalarColumnExpression`.
public func mid(_ field: ScalarColumnExpression, start: Int, length: Int) -> ScalarColumnExpression {
    return ScalarColumnExpression(.mid(field: field, start: start, length: length))
}

/// Create a `ScalarColumnExpression` using the LEN function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `ScalarColumnExpression`.
public func len(_ field: Column) -> ScalarColumnExpression {
    return ScalarColumnExpression(.len(field: field))
}

/// Create a `ScalarColumnExpression` using the UCASE function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `ScalarColumnExpression`.
public func ucase(_ field: Column) -> ScalarColumnExpression {
    return ScalarColumnExpression(.ucase(field: field))
}

/// Create a `ScalarColumnExpression` using the LCASE function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `ScalarColumnExpression`.
public func lcase(_ field: Column) -> ScalarColumnExpression {
    return ScalarColumnExpression(.lcase(field: field))
}

/// Create a `ScalarColumnExpression` using the ROUND function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Parameter to: The decimal to round the values to.
/// - Returns: An instance of `ScalarColumnExpression`.
public func round(_ field: Column, to decimal: Int) -> ScalarColumnExpression {
    return ScalarColumnExpression(.round(field: field, to: decimal))
}

/// Create a `ScalarColumnExpression` using the MID function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Parameter start: The starting position for the text extraction.
/// - Parameter length: The number of characters to return.
/// - Returns: An instance of `ScalarColumnExpression`.
public func mid(_ field: Column, start: Int, length: Int) -> ScalarColumnExpression {
    return ScalarColumnExpression(.mid(field: field, start: start, length: length))
}

