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

public struct AggregateColumnExpression : Field {
    public var alias: String?
    
    public private (set) var function: AggregateFunction
        
    init(_ function: AggregateFunction) {
        self.function = function
    }
    
    public indirect enum AggregateFunction {
        case avg(field: Field)
        case max(field: Field)
        case min(field: Field)
        case sum(field: Field)
        case last(field: Field)
        case first(field: Field)
        case count(field: Field)
        case countDistinct(field: Field)
        
        public func build(queryBuilder: QueryBuilder) -> String {
            switch self {
            case .avg(let field):
                return "AVG(" + field.build(queryBuilder: queryBuilder) + ")"
            case .max(let field):
                return "MAX(" + field.build(queryBuilder: queryBuilder) + ")"
            case .min(let field):
                return "MIN(" + field.build(queryBuilder: queryBuilder) + ")"
            case .sum(let field):
                return "SUM(" + field.build(queryBuilder: queryBuilder) + ")"
            case .last(let field):
                return "LAST(" + field.build(queryBuilder: queryBuilder) + ")"
            case .first(let field):
                return "FIRST(" + field.build(queryBuilder: queryBuilder) + ")"
            case .count(let field):
                return "COUNT(" + field.build(queryBuilder: queryBuilder) + ")"
            case .countDistinct(let field):
                return "COUNT(DISTINCT(" + field.build(queryBuilder: queryBuilder) + "))"
            }
        }
    }
    
    public func build(queryBuilder: QueryBuilder) -> String {
        var result = function.build(queryBuilder: queryBuilder)
        if let alias = alias {
            result += " AS " + alias
        }
        return result
    }
}

public func avg(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.avg(field: field))
}

public func max(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.max(field: field))
}

public func min(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.min(field: field))
}

public func sum(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.sum(field: field))
}

public func last(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.last(field: field))
}

public func first(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.first(field: field))
}

public func count(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.count(field: field))
}

public func countDistinct(_ field: AggregateColumnExpression) -> AggregateColumnExpression {
    return AggregateColumnExpression(.countDistinct(field: field))
}

public func avg(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.avg(field: field))
}

public func max(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.max(field: field))
}

public func min(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.min(field: field))
}

public func sum(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.sum(field: field))
}

public func last(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.last(field: field))
}

public func first(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.first(field: field))
}

public func count(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.count(field: field))
}

public func countDistinct(_ field: Column) -> AggregateColumnExpression {
    return AggregateColumnExpression(.countDistinct(field: field))
}
