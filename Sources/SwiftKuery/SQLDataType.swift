/**
 Copyright IBM Corporation 2017
 
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

// MARK: SQLDataType protocol

/// Defines the protocol for data types to be used as table column types.
public protocol SQLDataType {
    /// Return database specific representation of the type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    static func create(queryBuilder: QueryBuilder) -> String
}

/// SQL varchar type.
public struct Varchar: SQLDataType {
    /// Return database specific representation of the varchar type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return "varchar"
    }
}

/// SQL char/character type.
public struct Char: SQLDataType {
    /// Return database specific representation of the char type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.char.rawValue]
    }
}

/// SQL date type.
public struct SQLDate: SQLDataType {
    /// Return database specific representation of the date type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return "date"
    }
}

/// SQL time type.
public struct Time: SQLDataType {
    /// Return database specific representation of the time type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return "time"
    }
}

/// SQL timestamp type.
public struct Timestamp: SQLDataType {
    /// Return database specific representation of the timestamp type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return "timestamp"
    }
}

extension Int16: SQLDataType {
    /// Return database specific representation of the int16 type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return "smallint"
    }
}

extension Int32: SQLDataType {
    /// Return database specific representation of the int32 type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.int32.rawValue]
    }
}

extension Int64: SQLDataType {
    /// Return database specific representation of the int32 type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return "bigint"
    }
}

extension String: SQLDataType {
    /// Return database specific representation of the string type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return "text"
    }
}

extension Float: SQLDataType {
    /// Return database specific representation of the float type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.float.rawValue]
    }
}

extension Double: SQLDataType {
    /// Return database specific representation of the double type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.double.rawValue]
    }
}

extension Bool: SQLDataType {
    /// Return database specific representation of the boolean type using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the type.
    public static func create(queryBuilder: QueryBuilder) -> String {
        return "boolean"
    }
}



