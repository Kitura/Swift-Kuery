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

// MARK: ConditionalClause

/// A protocol for conditions used in SQL WHERE, ON and HAVING clauses.
public protocol ConditionalClause: Buildable {
    /// The type of the clause: either `Filter` or `Having`.
    associatedtype ClauseType: Buildable
    /// The type of the column expression used in the clause: either `ScalarColumnExpression` or `AggregateColumnExpression`.
    associatedtype ColumnExpressionType: Field
    /// The left hand side of the conditional clause.
    var lhs: Predicate<ClauseType, ColumnExpressionType>? { get }
    /// The right hand side of the conditional clause.
    var rhs: Predicate<ClauseType, ColumnExpressionType>?  { get }
    /// The operator of the conditional clause.
    var condition: Condition  { get }
    
    /// Build the clause using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the clause.
    /// - Throws: QueryError.syntaxError if query build fails.
    func build(queryBuilder: QueryBuilder) throws -> String
}

/// An extension of `ConditionalClause` with implementation of `Buildable` protocol.
public extension ConditionalClause {
    /// Build the clause using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the clause.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        guard lhs != nil else {
            if condition == .exists || condition == .notExists {
                guard rhs != nil else {
                    throw QueryError.syntaxError("No right hand side operand in conditional clause.")
                }
                return try condition.build(queryBuilder: queryBuilder) + " " + rhs!.build(queryBuilder: queryBuilder)
            }
            throw QueryError.syntaxError("No left hand side operand in conditional clause.")
        }
        
        guard rhs != nil else {
            if condition == .isNull || condition == .isNotNull {
                return try lhs!.build(queryBuilder: queryBuilder) + " " + condition.build(queryBuilder: queryBuilder)
            }
            throw QueryError.syntaxError("No right hand side operand in conditional clause.")
        }        
        
        let lhsBuilt = try lhs!.build(queryBuilder: queryBuilder)
        let conditionBuilt = condition.build(queryBuilder: queryBuilder)
        var rhsBuilt = ""
        if condition == .between || condition == .notBetween {
            switch rhs! {
            case .arrayOfString(let array):
                rhsBuilt = Utils.packType(array[0]) + " AND " + Utils.packType(array[1])
            case .arrayOfInt(let array):
                rhsBuilt = Utils.packType(array[0]) + " AND " + Utils.packType(array[1])
            case .arrayOfFloat(let array):
                rhsBuilt = Utils.packType(array[0]) + " AND " + Utils.packType(array[1])
            case .arrayOfDouble(let array):
                rhsBuilt = Utils.packType(array[0]) + " AND " + Utils.packType(array[1])
            case .arrayOfBool(let array):
                rhsBuilt = try Utils.packType(array[0], queryBuilder: queryBuilder) + " AND " + Utils.packType(array[1], queryBuilder: queryBuilder)
            case .arrayOfDate(let array):
                rhsBuilt = try Utils.packType(array[0], queryBuilder: queryBuilder) + " AND " + Utils.packType(array[1], queryBuilder: queryBuilder)
            case .arrayOfParameter(let array):
                rhsBuilt = try Utils.packType(array[0], queryBuilder: queryBuilder) + " AND " + Utils.packType(array[1], queryBuilder: queryBuilder)
            default:
                throw QueryError.syntaxError("Wrong type for right hand side operand in \(conditionBuilt) expression.")
            }
        }
        else if condition == .in || condition == .notIn {
            switch rhs! {
            case .arrayOfString(let array):
                rhsBuilt = "(\(array.map { Utils.packType($0) }.joined(separator: ", ")))"
            case .arrayOfInt(let array):
                rhsBuilt = "(\(array.map { Utils.packType($0) }.joined(separator: ", ")))"
            case .arrayOfFloat(let array):
                rhsBuilt = "(\(array.map { Utils.packType($0) }.joined(separator: ", ")))"
            case .arrayOfDouble(let array):
                rhsBuilt = "(\(array.map { Utils.packType($0) }.joined(separator: ", ")))"
            case .arrayOfBool(let array):
                rhsBuilt = try "(\(array.map { try Utils.packType($0, queryBuilder: queryBuilder) }.joined(separator: ", ")))"
            case .arrayOfDate(let array):
                rhsBuilt = try "(\(array.map { try Utils.packType($0, queryBuilder: queryBuilder) }.joined(separator: ", ")))"
            case .arrayOfParameter(let array):
                rhsBuilt = try "(\(array.map { try Utils.packType($0, queryBuilder: queryBuilder) }.joined(separator: ", ")))"
            case .select(let query):
                rhsBuilt = try "(" + query.build(queryBuilder: queryBuilder) + ")"
            default:
                throw QueryError.syntaxError("Wrong type for right hand side operand in \(conditionBuilt) expression.")
            }
        }
        else {
            rhsBuilt = try rhs!.build(queryBuilder: queryBuilder)
        }
        return lhsBuilt + " " + conditionBuilt + " " + rhsBuilt
    }
}
