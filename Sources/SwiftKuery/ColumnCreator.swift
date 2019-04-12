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

    func packType(_ item: Any, queryBuilder: QueryBuilder) throws -> String

    func getDefaultValue(for column: Column, queryBuilder: QueryBuilder) throws -> String?
}

public extension ColumnCreator {

    func getDefaultValue(for column: Column, queryBuilder: QueryBuilder) -> String? {
        guard let defaultValue = column.defaultValue else {
            if column.nullDefaultValue {
                return "NULL"
            }
            return nil
        }
        do{
            return try packType(defaultValue, queryBuilder: queryBuilder)
        } catch {
            return nil
        }
    }

    func packType(_ item: Any, queryBuilder: QueryBuilder) throws -> String {
        switch item {
        case let val as String:
            return "'\(val)'"
        case let val as Bool:
            return val ? queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.booleanTrue.rawValue]
                : queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.booleanFalse.rawValue]
        case let val as Parameter:
            return try val.build(queryBuilder: queryBuilder)
        case let value as Date:
            if let dateFormatter = queryBuilder.dateFormatter {
                return dateFormatter.string(from: value)
            }
            return "'\(String(describing: value))'"
        default:
            return String(describing: item)
        }
    }

}
