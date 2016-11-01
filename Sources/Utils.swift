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

func packType(_ item: Any) -> String {
    switch item {
    case let val as String:
        return "'\(val)'"
    default:
        return String(describing: item)
    }
}

func packType(_ item: Any, queryBuilder: QueryBuilder) throws -> String {
    switch item {
    case let val as String:
        return "'\(val)'"
    case let val as Parameter:
        return try val.build(queryBuilder: queryBuilder)
    default:
        return String(describing: item)
    }
}

func updateParameterNumbers(query: String, queryBuilder: QueryBuilder) -> String {
    var resultQuery = ""
    var inputQuery = query
    let marker = queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.numberedParameter.rawValue]
    var range = inputQuery.range(of: marker)
    var index = 1
    while range != nil {
        resultQuery += inputQuery.substring(to: range!.upperBound) + "\(index)"
        index += 1
        inputQuery = inputQuery.substring(from: range!.upperBound)
        range = inputQuery.range(of: marker)
    }
    resultQuery += inputQuery
    return resultQuery
}
