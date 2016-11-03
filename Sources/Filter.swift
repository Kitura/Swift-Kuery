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
import Foundation

/// A condition used in SQL WHERE and ON clauses.
public struct Filter : Buildable {
    /// The left hand side of the conditional clause.
    public let lhs: FilterPredicate
    /// The right hand side of the conditional clause.
    public let rhs: FilterPredicate
    /// The operator of the conditional clause.
    public let condition: Condition
    
    init(lhs: FilterPredicate, rhs: FilterPredicate, condition: Condition) {
        self.lhs = lhs
        self.rhs = rhs
        self.condition = condition
    }
    
    /// Build the filter using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the filter.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        return try lhs.build(queryBuilder: queryBuilder) + " " + condition.build(queryBuilder: queryBuilder) + " " + rhs.build(queryBuilder: queryBuilder)
    }
    
    /// An operand of `Filter`: either a `Filter` itself, or a value, a column, or a `ScalarColumnExpression`.
    public indirect enum FilterPredicate : Buildable {
        /// A `Filter`.
        case filter(Filter)
        /// A String.
        case string(String)
        /// A number.
        case number(NSNumber)
        /// A value of type Any.
        case value(Any)
        /// A `Column`.
        case column(Column)
        /// A `ScalarColumnExpression`.
        case scalarColumnExpression(ScalarColumnExpression)
        
        /// Build the filter predicate using `QueryBuilder`.
        ///
        /// - Parameter queryBuilder: The QueryBuilder to use.
        /// - Returns: A String representation of the filter predicate.
        /// - Throws: QueryError.syntaxError if query build fails.
        public func build(queryBuilder: QueryBuilder) throws -> String {
            switch self {
            case .filter(let filter):
                return try "(" + filter.build(queryBuilder: queryBuilder) + ")"
            case .string(let string):
                return packType(string)
            case .number(let number):
                return packType(number)
            case .value(let value):
                return value as! String
            case .column(let column):
                return column.build(queryBuilder: queryBuilder)
            case .scalarColumnExpression(let scalarColumnExpression):
                return try scalarColumnExpression.build(queryBuilder: queryBuilder)
            }
        }
    }
}

public func == (lhs: ScalarColumnExpression, rhs: String) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .string(rhs), condition: .equal)
}

public func == (lhs: Column, rhs: String) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .string(rhs), condition: .equal)
}

public func == (lhs: Column, rhs: Column) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .column(rhs), condition: .equal)
}

public func >= (lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .number(NSNumber(value: rhs)), condition: .greaterThanOrEqual)
}

public func >= (lhs: Column, rhs: Int) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .number(NSNumber(value: rhs)), condition: .greaterThanOrEqual)
}

public func == (lhs: Column, rhs: Int) -> Filter {
    return Filter(lhs: .column(lhs), rhs: .number(NSNumber(value: rhs)), condition: .equal)
}

public func == (lhs: ScalarColumnExpression, rhs: Int) -> Filter {
    return Filter(lhs: .scalarColumnExpression(lhs), rhs: .number(NSNumber(value: rhs)), condition: .equal)
}

public func || (lhs: Filter, rhs: Filter) -> Filter {
    return Filter(lhs: .filter(lhs), rhs: .filter(rhs), condition: .or)
}

public func && (lhs: Filter, rhs: Filter) -> Filter {
    return Filter(lhs: .filter(lhs), rhs: .filter(rhs), condition: .and)
}

public extension ScalarColumnExpression {
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .string(pattern), condition: .like)
    }
    
    public func between(_ value1: String, and value2: String) -> Filter {
        return Filter(lhs: .scalarColumnExpression(self), rhs: .value(packType(value1) + " AND " + packType(value2)), condition: .between)
    }
    
    public func `in`(_ values: String...) -> Filter {
        let rhs = "(\(values.map { packType($0) }.joined(separator: ", ")))"
        return Filter(lhs: .scalarColumnExpression(self), rhs: .value(rhs), condition: .isIn)
    }
}

public extension Column {
    public func like(_ pattern: String) -> Filter {
        return Filter(lhs: .column(self), rhs: .string(pattern), condition: .like)
    }
    
    public func between(_ value1: String, and value2: String) -> Filter {
        return Filter(lhs: .column(self), rhs: .value(packType(value1) + " AND " + packType(value2)), condition: .between)
    }
    
    public func `in`(_ values: String...) -> Filter {
        let rhs = "(\(values.map { packType($0) }.joined(separator: ", ")))"
        return Filter(lhs: .column(self), rhs: .value(rhs), condition: .isIn)
    }
}

