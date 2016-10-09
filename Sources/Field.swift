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


public protocol Field {
    
    var alias: String? { get set }
    
    func `as`(_ newName: String) -> Field
    
    func build(queryBuilder: QueryBuilder) -> String
}

public extension Field {
    public func `as`(_ newName: String) -> Field {
        var new = self
        new.alias = newName
        return new
    }
}


//precedencegroup RenamePrecedence {
//    associativity: left
//    higherThan: LogicalConjunctionPrecedence
//}
//
//infix operator |> : RenamePrecedence
//public func |> ( lhs: Field, rhs: String) -> Field {
//    var field = lhs
//    print("field  ", lhs.rename)
//    print("new name ", rhs)
//    field.rename = rhs
//    print("renamed ", field.rename)
//    return field
//}
