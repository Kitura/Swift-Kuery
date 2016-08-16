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

// Field: column and function
public struct Field: Hashable {
    
    public let name : String
    
    public var rename: String?
    
    private var function : Function?
    
    public var hashValue: Int {
        return name.hashValue
    }
    
    public var description : String {
        if let function = function {
            return rename != nil ? "\(function.description(name)) AS \(rename!)"
                : function.description(name)
        }
        return name
    }
    
    public init(_ name: String) {
        self.name = name
        self.rename = nil
    }
    
    init(_ function: Function, _ name: String) {
        self.name = name
        self.rename = nil
        self.function = function
    }
}

enum Function {
    
    case now
    case avg
    case max
    case min
    case sum
    case len
    case last
    case first
    case ucase
    case lcase
    case count
    case countDistinct
    case round(to: Int)
    case mid(start: Int, length: Int)
    
    public func description(_ name: String) -> String {
        switch self {
        case .now                       : return "NOW"
        case .avg                       : return "AVG( \(name) )"
        case .max                       : return "MAX( \(name) )"
        case .min                       : return "MIN( \(name) )"
        case .sum                       : return "SUM( \(name) )"
        case .len                       : return "LEN( \(name) )"
        case .last                      : return "LAST( \(name) )"
        case .first                     : return "FIRST( \(name) )"
        case .ucase                     : return "UCASE( \(name) )"
        case .lcase                     : return "LCASE( \(name) )"
        case .count                     : return "COUNT( \(name) )"
        case .countDistinct             : return "COUNT(DISTINCT( \(name) )"
        case .round(let dec)            : return "ROUND( \(name), \(dec) )"
        case .mid(let start, let len)   : return "LEN( \(name), \(start), \(len)  )"
        }
    }
}

public func == (lhs: Field, rhs: Field) -> Bool {
    return lhs.hashValue == rhs.hashValue
}


public func now() -> Field {
    return Field(.now, "now")
}
public func avg(_ field: Field) -> Field {
    return Field(.avg, field.name)
}
public func max(_ field: Field) -> Field {
    return Field(.max, field.name)
}
public func min(_ field: Field) -> Field {
    return Field(.min, field.name)
}
public func sum(_ field: Field) -> Field {
    return Field(.sum, field.name)
}
public func len(_ field: Field) -> Field {
    return Field(.len, field.name)
}
public func last(_ field: Field) -> Field {
    return Field(.last, field.name)
}
public func first(_ field: Field) -> Field {
    return Field(.first, field.name)
}
public func ucase(_ field: Field) -> Field {
    return Field(.ucase, field.name)
}
public func lcase(_ field: Field) -> Field {
    return Field(.lcase, field.name)
}
public func count(_ field: Field) -> Field {
    return Field(.count, field.name)
}
public func countDistinct(_ field: Field) -> Field {
    return Field(.countDistinct, field.name)
}
public func round(_ field: Field, to decimal: Int) -> Field {
    return Field(.round(to: decimal), field.name)
}
public func mid(_ field: Field, start: Int, length: Int) -> Field {
    return Field(.mid(start: start, length: length), field.name)
}
// Where
public struct Where {
    var predicate : String
    
    public init(_ predicate: String) {
        self.predicate = predicate
    }
}

infix operator |> {associativity left precedence 100}
public func |> ( lhs: Field, rhs: String) -> Field {
    var field = lhs
    field.rename = rhs
    return field
}

public func convert(_ item: ValueType) -> String {
    switch item {
    case is String  : return "'\(String(describing: item))'"
    default: return "\(String(describing: item))"
    }
}


public func == (lhs: Field, rhs: ValueType) -> Where {
    return Where("\(lhs.description) == \(convert(rhs))")
}

public func || (lhs: Where, rhs: Where) -> Where {
    return Where("(\(lhs.predicate)) OR (\(rhs.predicate))")
}

public func && (lhs: Where, rhs: Where) -> Where {
    return Where("( \(lhs.predicate) ) AND ( \( rhs.predicate) )")
}

// other operators and other types


public enum Order {
    case ASCD(Field)
    case DESC(Field)
    
    var description: String {
        switch self {
        case .ASCD(let field ) : return "\(field.name) ASCD"
        case .DESC(let field ) : return "\(field.name) DESC"
        }
    }
}

public struct Having {
    var clause: String
    
    public init(_ clause: String) {
        self.clause = clause
    }
}

public func == (lhs: Field, rhs: Any) -> Having {
    return Having("\(lhs.description) == \(String(describing: rhs))")
}
public func != (lhs: Field, rhs: Any) -> Having {
    return Having("\(lhs.description) != \(String(describing: rhs))")
}
public func > (lhs: Field, rhs: Any) -> Having {
    return Having("\(lhs.description) > \(String(describing: rhs))")
}
public func >= (lhs: Field, rhs: Any) -> Having {
    return Having("\(lhs.description) >= \(String(describing: rhs))")
}
public func < (lhs: Field, rhs: Any) -> Having {
    return Having("\(lhs.description) < \(String(describing: rhs))")
}
public func <= (lhs: Field, rhs: Any) -> Having {
    return Having("\(lhs.description) <= \(String(describing: rhs))")
}

public func && (lhs: Having, rhs: Having) -> Having {
    return Having("\(lhs.clause), \(rhs.clause)")
}
