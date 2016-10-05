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

public struct ScalarColumnExpression : Field {
    
    private var alias: String?
    
    public private (set) var function: ScalarFunction
    
    public var rename: String? {
        get {
            return alias
        }
        set {
            alias = newValue
        }
    }
    
    init(_ function: ScalarFunction) {
        self.function = function
    }
    
    public indirect enum ScalarFunction {
        case now()
        case ucase(field: Field)
        case lcase(field: Field)
        case round(field: Field, to: Int)
        case mid(field: Field, start: Int, length: Int)
        case len(field: Field)
        case format(field: Field, format: String)
        
        public func build(queryBuilder: QueryBuilder) -> String {
            switch self {
            case .now:
                return "NOW()"
            case .ucase(let field):
                return queryBuilder.names[QueryBuilder.QueryNames.ucase.rawValue] + "(" + field.build(queryBuilder: queryBuilder) + ")"
            case .lcase(let field):
                return queryBuilder.names[QueryBuilder.QueryNames.lcase.rawValue] + "(" + field.build(queryBuilder: queryBuilder) + ")"
            case .round(let field, let decimal):
                return "ROUND(" + field.build(queryBuilder: queryBuilder) + ", \(decimal))"
            case .mid(let field, let start, let length):
                return "MID(" + field.build(queryBuilder: queryBuilder) + ", \(start), \(length))"
            case .len(let field):
                return "LEN(" + field.build(queryBuilder: queryBuilder) + ")"
            case .format(let field, let format):
                return "FORMAT(" + field.build(queryBuilder: queryBuilder) + ", \(format))"
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

public func now() -> ScalarColumnExpression {
    return ScalarColumnExpression(.now())
}

public func len(_ field: ScalarColumnExpression) -> ScalarColumnExpression {
    return ScalarColumnExpression(.len(field: field))
}

public func ucase(_ field: ScalarColumnExpression) -> ScalarColumnExpression {
    return ScalarColumnExpression(.ucase(field: field))
}

public func lcase(_ field: ScalarColumnExpression) -> ScalarColumnExpression {
    return ScalarColumnExpression(.lcase(field: field))
}

public func round(_ field: ScalarColumnExpression, to decimal: Int) -> ScalarColumnExpression {
    return ScalarColumnExpression(.round(field: field, to: decimal))
}

public func mid(_ field: ScalarColumnExpression, start: Int, length: Int) -> ScalarColumnExpression {
    return ScalarColumnExpression(.mid(field: field, start: start, length: length))
}

public func len(_ field: Column) -> ScalarColumnExpression {
    return ScalarColumnExpression(.len(field: field))
}

public func ucase(_ field: Column) -> ScalarColumnExpression {
    return ScalarColumnExpression(.ucase(field: field))
}

public func lcase(_ field: Column) -> ScalarColumnExpression {
    return ScalarColumnExpression(.lcase(field: field))
}

public func round(_ field: Column, to decimal: Int) -> ScalarColumnExpression {
    return ScalarColumnExpression(.round(field: field, to: decimal))
}

public func mid(_ field: Column, start: Int, length: Int) -> ScalarColumnExpression {
    return ScalarColumnExpression(.mid(field: field, start: start, length: length))
}

