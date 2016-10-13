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

import Foundation

public struct Having {
    public let lhs: HavingPredicate
    public let rhs: HavingPredicate
    public let condition: Condition
    
    init(lhs: HavingPredicate, rhs: HavingPredicate, condition: Condition) {
        self.lhs = lhs
        self.rhs = rhs
        self.condition = condition
    }
    
    public func build(queryBuilder: QueryBuilder) -> String {
        return lhs.build(queryBuilder: queryBuilder) + " " + condition.build(queryBuilder: queryBuilder) + " " + rhs.build(queryBuilder: queryBuilder)
    }
}

public indirect enum HavingPredicate {
    case havingClause(Having)
    case string(String)
    case number(NSNumber)
    case value(Any)
    case column(Column)
    case aggregateColumnExpression(AggregateColumnExpression)
        
    public func build(queryBuilder: QueryBuilder) -> String {
        switch self {
        case .havingClause(let havingClause):
            return "(" + havingClause.build(queryBuilder: queryBuilder) + ")"
        case .string(let string):
            return packType(string)
        case .number(let number):
            return packType(number)
        case .value(let value):
            return packType(value)
        case .column(let column):
            return "(" + column.build(queryBuilder: queryBuilder) + ")"
        case .aggregateColumnExpression(let aggregateColumnExpression):
            return "(" + aggregateColumnExpression.build(queryBuilder: queryBuilder) + ")"
        }
    }
}

public func == (lhs: AggregateColumnExpression, rhs: String) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .string(rhs), condition: .equal)
}

public func == (lhs: Column, rhs: String) -> Having {
    return Having(lhs: .column(lhs), rhs: .string(rhs), condition: .equal)
}

public func == (lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .number(NSNumber(value: rhs)), condition: .equal)
}

public func > (lhs: Column, rhs: Int) -> Having {
    return Having(lhs: .column(lhs), rhs: .number(NSNumber(value: rhs)), condition: .greaterThan)
}

public func > (lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .number(NSNumber(value: rhs)), condition: .greaterThan)
}

public func == (lhs: AggregateColumnExpression, rhs: Int) -> Having {
    return Having(lhs: .aggregateColumnExpression(lhs), rhs: .number(NSNumber(value: rhs)), condition: .equal)
}

public func || (lhs: Having, rhs: Having) -> Having {
    return Having(lhs: .havingClause(lhs), rhs: .havingClause(rhs), condition: .or)
}

public func && (lhs: Having, rhs: Having) -> Having {
    return Having(lhs: .havingClause(lhs), rhs: .havingClause(rhs), condition: .and)
}
