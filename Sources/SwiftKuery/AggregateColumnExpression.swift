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

// MARK: AggregateColumnExpression

/// An expression containing an aggregate function applied on a column.
public struct AggregateColumnExpression: Field {
    
    /// The alias of the field.
    public var alias: String?
    
    /// The aggregate function to apply.
    public private (set) var function: AggregateFunction
        
    init(_ function: AggregateFunction) {
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

    /// An enumeration of the supported aggregate functions that can applied on a column.
    public enum AggregateFunction {
        /// The SQL AVG function.
        case avg(field: Field)
        /// The SQL MAX function.
        case max(field: Field)
        /// The SQL MIN function.
        case min(field: Field)
        /// The SQL SUM function.
        case sum(field: Field)
        /// The SQL LAST function.
        case last(field: Field)
        /// The SQL FIRST function.
        case first(field: Field)
        /// The SQL COUNT function.
        case count(field: Field)
        /// The SQL COUNT DISTINCT function.
        case countDistinct(field: Field)
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
            case .avg(let field):
                return try "AVG(" + field.build(queryBuilder: queryBuilder) + ")"
            case .max(let field):
                return try "MAX(" + field.build(queryBuilder: queryBuilder) + ")"
            case .min(let field):
                return try "MIN(" + field.build(queryBuilder: queryBuilder) + ")"
            case .sum(let field):
                return try "SUM(" + field.build(queryBuilder: queryBuilder) + ")"
            case .last(let field):
                return try "LAST(" + field.build(queryBuilder: queryBuilder) + ")"
            case .first(let field):
                return try "FIRST(" + field.build(queryBuilder: queryBuilder) + ")"
            case .count(let field):
                return try "COUNT(" + field.build(queryBuilder: queryBuilder) + ")"
            case .countDistinct(let field):
                return try "COUNT(DISTINCT(" + field.build(queryBuilder: queryBuilder) + "))"
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

/// Create an `AggregateColumnExpression` using the AVG function.
///
/// - Parameter field: The `Field` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func avg(_ field: Field) -> AggregateColumnExpression {
    return AggregateColumnExpression(.avg(field: field))
}

/// Create an `AggregateColumnExpression` using the MAX function.
///
/// - Parameter field: The `Field` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func max(_ field: Field) -> AggregateColumnExpression {
    return AggregateColumnExpression(.max(field: field))
}

/// Create an `AggregateColumnExpression` using the MIN function.
///
/// - Parameter field: The `Field` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func min(_ field: Field) -> AggregateColumnExpression {
    return AggregateColumnExpression(.min(field: field))
}

/// Create an `AggregateColumnExpression` using the SUM function.
///
/// - Parameter field: The `Field` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func sum(_ field: Field) -> AggregateColumnExpression {
    return AggregateColumnExpression(.sum(field: field))
}

/// Create an `AggregateColumnExpression` using the LAST function.
///
/// - Parameter field: The `Field` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func last(_ field: Field) -> AggregateColumnExpression {
    return AggregateColumnExpression(.last(field: field))
}

/// Create an `AggregateColumnExpression` using the FIRST function.
///
/// - Parameter field: The `Field` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func first(_ field: Field) -> AggregateColumnExpression {
    return AggregateColumnExpression(.first(field: field))
}

/// Create an `AggregateColumnExpression` using the COUNT function.
///
/// - Parameter field: The `Field` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func count(_ field: Field) -> AggregateColumnExpression {
    return AggregateColumnExpression(.count(field: field))
}

/// Create an `AggregateColumnExpression` using the COUNT DISTINCT function.
///
/// - Parameter field: The `Field` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func countDistinct(_ field: Field) -> AggregateColumnExpression {
    return AggregateColumnExpression(.countDistinct(field: field))
}

/// Create a `AggregateColumnExpression` using the LEN function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func len(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.len(field: field))
}

/// Create a `AggregateColumnExpression` the using UCASE function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func ucase(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.ucase(field: field))
}

/// Create a `AggregateColumnExpression` using the LCASE function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func lcase(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.lcase(field: field))
}

/// Create a `AggregateColumnExpression` using the ROUND function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Parameter to: The decimal to round the values to.
/// - Returns: An instance of `AggregateColumnExpression`.
public func round(_ field: AggregateColumnExpression, to decimal: Int) -> AggregateColumnExpression {
    return AggregateColumnExpression(.round(field: field, to: decimal))
}

/// Create a `AggregateColumnExpression` using the MID function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Parameter start: The starting position for the text extraction.
/// - Parameter length: The number of characters to return.
/// - Returns: An instance of `AggregateColumnExpression`.
public func mid(_ field: AggregateColumnExpression, start: Int, length: Int) -> AggregateColumnExpression {
    return AggregateColumnExpression(.mid(field: field, start: start, length: length))
}


