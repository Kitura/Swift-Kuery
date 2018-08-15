/**
 Copyright IBM Corporation 2018
 
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

// MARK: ColumnCreator protocol

/// A protocol defining functions database plugins must implement to build a string representation of a Column
public protocol ColumnCreator {

    /// Build a string representation of the column
    ///
    /// - Parameter column: The column being built
    /// - Returns: A string representation of the column for the implementing database or nil if it cannot be built
    func buildColumn(for column: Column, using queryBuilder: QueryBuilder) -> String?
}
