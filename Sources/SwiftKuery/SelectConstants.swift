//
//  SelectConstants.swift
//  ScribbleServer
//
//  Created by Bridger Maxwell on 7/8/17.
//

import Foundation

// Mark: SelectConstants

public struct ConstantField: Field {
    /// The alias of the field.
    public var alias: String?

    /// Build the query component using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query component.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        switch value {
        case let val as String:
            return "'\(val)'"
        case let value as Date:
            return "'\(String(describing: value))'"
        case let constantFunction as ConstantFunction:
            switch constantFunction {
            case .now:
                return queryBuilder.substitutions[QueryBuilder.QuerySubstitutionNames.now.rawValue]
            }
        case let buildable as Buildable:
            return try buildable.build(queryBuilder: queryBuilder)
        default:
            return String(describing: value)
        }
    }

    let value: Any
    public init(_ value: Any) {
        self.value = value
    }

    public enum ConstantFunction {
        case now()
    }
}

/// The SQL SELECT statement with constants instead of a table.
public struct SelectConstants: SelectQuery {
    /// An array of constants to select.
    public let values: [ConstantField]

    /// The SQL WHERE clause containing the filter for rows to retrieve.
    /// Could be represented with a `Filter` clause or a `String` containing raw SQL.
    public private (set) var whereClause: QueryFilterProtocol?

    private var syntaxError = ""

    /// Initialize an instance of Select.
    ///
    /// - Parameter values: A list of `ConstantField` elements to select.
    public init(_ values: ConstantField...) {
        self.values = values
    }

    public init(_ values: Any...) {
        self.values = values.map({ ConstantField($0) })
    }

    /// Initialize an instance of Select.
    ///
    /// - Parameter values: An array of `ConstantField` elements to select.
    public init(values: [ConstantField]) {
        self.values = values
    }

    /// Build the query using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        var result = ""

        result += "SELECT "

        result += try "\(values.map { try $0.build(queryBuilder: queryBuilder) }.joined(separator: ", "))"

        if let whereClause = whereClause {
            result += try " WHERE " + whereClause.build(queryBuilder: queryBuilder)
        }

        result = Utils.updateParameterNumbers(query: result, queryBuilder: queryBuilder)
        return result
    }

    /// Add an SQL WHERE clause to the select statement.
    ///
    /// - Parameter conditions: The `Filter` clause or a `String` containing SQL WHERE clause to apply.
    /// - Returns: A new instance of Select with the WHERE clause.
    public func `where`(_ conditions: QueryFilterProtocol) -> SelectConstants {
        var new = self
        if whereClause != nil {
            new.syntaxError += "Multiple where clauses. "
        } else {
            new.whereClause = conditions
        }
        return new
    }

    public var columnCount: Int? {
        return self.values.count
    }
}

