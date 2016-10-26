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

public enum Condition {
    case equal
    case notEqual
    case greaterThan
    case lessThan
    case greaterThanOrEqual
    case lessThanOrEqual
    case between
    case notBetween
    case like
    case isIn
    case and
    case or
    
    public func build(queryBuilder: QueryBuilder) -> String {
        switch self {
        case .equal:
            return "="
        case .notEqual:
            return "<>"
        case .greaterThan:
            return ">"
        case .lessThan:
            return "<"
        case .greaterThanOrEqual:
            return ">="
        case .lessThanOrEqual:
            return "<="
        case .between:
            return "BETWEEN"
        case .notBetween:
            return "NOT BETWEEN"
        case .like:
            return "LIKE"
        case .isIn:
            return "IN"
        case .and:
            return "AND"
        case .or:
            return "OR"
        }
    }
}

