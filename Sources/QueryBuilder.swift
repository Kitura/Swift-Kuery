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


public class QueryBuilder {
    public var substitutions: [String]
    public enum QuerySubstitutionNames : Int {
        case ucase
        case lcase
        case len
        case numberedParameter
        case namedParameter
        case namesCount // last case, add new values before it
    }
    
    public var addNumbersToParameters = true
    public var firstParameterIndex = 1
    
    public init(addNumbersToParameters: Bool?=nil, firstParameterIndex: Int?=nil) {
        substitutions = Array(repeating: "", count: QuerySubstitutionNames.namesCount.rawValue)
        substitutions[QuerySubstitutionNames.ucase.rawValue] = "UCASE"
        substitutions[QuerySubstitutionNames.lcase.rawValue] = "LCASE"
        substitutions[QuerySubstitutionNames.len.rawValue] = "LEN"
        substitutions[QuerySubstitutionNames.numberedParameter.rawValue] = "?"
        substitutions[QuerySubstitutionNames.namedParameter.rawValue] = "@"
        if let addNumbersToParameters = addNumbersToParameters {
            self.addNumbersToParameters = addNumbersToParameters
        }
        if let firstParameterIndex = firstParameterIndex {
            self.firstParameterIndex = firstParameterIndex
        }
    }
    
    public func updateSubstitutions(_ newSubstitutions: [QuerySubstitutionNames:String]) {
        for (index, substitution) in newSubstitutions {
            substitutions[index.rawValue] = substitution
        }
    }
}
