/**
* Copyright IBM Corporation 2016, 2017
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
**/

public extension Filter {

    /// Create a `Filter` clause using the isNull operator.
    ///
    /// - Returns: A `Filter` containing the clause.
    public func isNull() -> Filter {
        return Filter(lhs: .clause(self), condition: .isNull)
    }

    /// Create a `Filter` clause using the isNotNull operator.
    ///
    /// - Returns: A `Filter` containing the clause.
    public func isNotNull() -> Filter {
        return Filter(lhs: .clause(self), condition: .isNotNull)
    }
}
public extension Having {

    /// Create a `Having` clause using the isNull operator.
    ///
    /// - Returns: A `Having` containing the clause.
    public func isNull() -> Having {
        return Having(lhs: .clause(self), condition: .isNull)
    }

    /// Create a `Having` clause using the isNotNull operator.
    ///
    /// - Returns: A `Having` containing the clause.
    public func isNotNull() -> Having {
        return Having(lhs: .clause(self), condition: .isNotNull)
    }
}
