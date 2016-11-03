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

// MARK: AggregateColumnExpression

/// An expression containing an aggregate function applied on a column.
public struct AggregateColumnExpression : Field {
    
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
            result += " AS " + alias
        }
        return result
    }

    /// An enumeration of the supported aggregate functions that can applied on a column.
    public indirect enum AggregateFunction {
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
            }
        }
    }
}

/// Create an `AggregateColumnExpression` using AVG function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func avg(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.avg(field: field))
}

/// Create an `AggregateColumnExpression` using MAX function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func max(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.max(field: field))
}

/// Create an `AggregateColumnExpression` using MIN function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func min(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.min(field: field))
}

/// Create an `AggregateColumnExpression` using SUM function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func sum(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.sum(field: field))
}

/// Create an `AggregateColumnExpression` using LAST function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func last(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.last(field: field))
}

/// Create an `AggregateColumnExpression` using FIRST function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func first(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.first(field: field))
}

/// Create an `AggregateColumnExpression` using COUNT function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func count(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.count(field: field))
}

/// Create an `AggregateColumnExpression` using COUNT DISTINCT function.
///
/// - Parameter field: The `AggregateColumnExpression` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func countDistinct(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.countDistinct(field: field))
}

/// Create an `AggregateColumnExpression` using AVG function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func avg(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.avg(field: field))
}

/// Create an `AggregateColumnExpression` using MAX function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func max(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.max(field: field))
}

/// Create an `AggregateColumnExpression` using MIN function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func min(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.min(field: field))
}

/// Create an `AggregateColumnExpression` using SUM function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func sum(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.sum(field: field))
}

/// Create an `AggregateColumnExpression` using LAST function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func last(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.last(field: field))
}

/// Create an `AggregateColumnExpression` using FIRST function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func first(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.first(field: field))
}

/// Create an `AggregateColumnExpression` using COUNT function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func count(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.count(field: field))
}

/// Create an`AggregateColumnExpression` using COUNT DISTINCT function.
///
/// - Parameter field: The `Column` to apply the function on.
/// - Returns: An instance of `AggregateColumnExpression`.
public func countDistinct(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.countDistinct(field: field))
}
