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

open class WithTable: Table {
    
    private var query: Query?
    
    public required init(as query: Query) {
        super.init()
        self.query = query
    }
    
    public required init() {
    }
    
    public func buildWith(queryBuilder: QueryBuilder) throws -> String {
        guard let query = query else {
            throw QueryError.syntaxError("With query was not specified. ")
        }
        return nameInQuery + " AS " + "(" + (try query.build(queryBuilder: queryBuilder)) + ")"
    }
    
}
