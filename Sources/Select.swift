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

// Mark: Select

public protocol SelectionFilter: Buildable {
    
}

extension Filter: SelectionFilter {
    
}


public protocol SelectionHaving: Buildable {
    
}

extension Having: SelectionHaving {
    
}

extension String: SelectionFilter, SelectionHaving {
    
    public func build(queryBuilder: QueryBuilder) throws -> String {
        return self
    }
}



/// The SQL SELECT statement.
public struct Select: Query {
    
    /// An array of `Field` elements to select.
    public let fields: [Field]?
    
    /// The table to select rows from.
    public let tables: [Table]
    
    /// The SQL WHERE clause containing the filter for rows to retrieve.
    public private (set) var whereClause: SelectionFilter?
    
    /// A boolean indicating whether the selected values have to be distinct.
    /// If true, corresponds to the SQL SELECT DISTINCT statement.
    public private (set) var distinct = false
    
    /// The number of rows to select.
    /// If specified, corresponds to the SQL SELECT TOP/LIMIT clause.
    public private (set) var top: Int?

    /// The number of rows to skip.
    /// If specified, corresponds to the SQL SELECT OFFSET clause.
    public private (set) var offset: Int?

    /// An array containing `OrderBy` elements to sort the selected rows.
    /// The SQL ORDER BY keyword.
    public private (set) var orderBy: [OrderBy]?
    
    /// An array containing `Column` elements to group the selected rows.
    /// The SQL GROUP BY statement.
    public private (set) var groupBy: [Column]?

    /// The SQL HAVING clause containing the filter for the rows to select when aggregate functions are used.
    public private (set) var havingClause: SelectionHaving?
    
    /// The SQL UNION clauses.
    public private (set) var unions: [Union]?

    /// The SQL JOIN clause.
    public private (set) var join: Join?

    /// The SQL ON clause containing the filter for the rows to select in a JOIN query.
    public private (set) var onClause: Filter?

    /// A String containg the raw SQL ON clause to filter the rows to select in a JOIN query.
    public private (set) var rawOnClause: String?

    /// The SQL USING clause: an array of `Column` elements that have to match in a JOIN query.
    public private (set) var using: [Column]?

    private var syntaxError = ""

    /// Initialize an instance of Select.
    ///
    /// - Parameter fields: A list of `Field` elements to select.
    /// - Parameter from table: The table to select from.
    public init(_ fields: Field..., from table: Table) {
        self.fields = fields
        self.tables = [table]
    }
    
    /// Initialize an instance of Select.
    ///
    /// - Parameter fields: An array of `Field` elements to select.
    /// - Parameter from table: The table(s) to select from.
    public init(fields: [Field], from table: Table...) {
        self.fields = fields
        self.tables = table
    }

    /// Initialize an instance of Select.
    ///
    /// - Parameter fields: A list of `Field` elements to select.
    /// - Parameter from table: An array of tables to select from.
    public init(_ fields: Field..., from tables: [Table]) {
        self.fields = fields
        self.tables = tables
    }

    /// Initialize an instance of Select.
    ///
    /// - Parameter fields: An array of `Field` elements to select.
    /// - Parameter from table: An array of tables to select from.
    public init(fields: [Field], from tables: [Table]) {
        self.fields = fields
        self.tables = tables
    }

    /// Build the query using `QueryBuilder`.
    ///
    /// - Parameter queryBuilder: The QueryBuilder to use.
    /// - Returns: A String representation of the query.
    /// - Throws: QueryError.syntaxError if query build fails.
    public func build(queryBuilder: QueryBuilder) throws -> String {
        var syntaxError = self.syntaxError
        if join == nil {
            if onClause != nil || rawOnClause != nil {
                syntaxError += "On clause set for statement that is not join. "
            }
            if using != nil {
                syntaxError += "On clause set for statement that is not join. "
            }
        }
        
        if groupBy == nil && (self.havingClause != nil) {
            syntaxError += "Having clause is not allowed without a group by clause. "
        }
        
        if syntaxError != "" {
            throw QueryError.syntaxError(syntaxError)
        }

        var result = "SELECT "
        if distinct {
            result += "DISTINCT "
        }
        
        if let fields = fields, fields.count != 0 {
            result += try "\(fields.map { try $0.build(queryBuilder: queryBuilder) }.joined(separator: ", "))"
        }
        else {
            result += "*"
        }
        
        result += " FROM "
        result += try "\(tables.map { try $0.build(queryBuilder: queryBuilder) }.joined(separator: ", "))"
        
        if let join = join {
            result += try join.build(queryBuilder: queryBuilder)
        }
        
        if let onClause = onClause {
            result += try " ON " + onClause.build(queryBuilder: queryBuilder)
        }
        else if let using = using {
            result += " USING (" + using.map { $0.name }.joined(separator: ", ") + ")"
        }
        
        if let whereClause = whereClause {
            result += try " WHERE " + whereClause.build(queryBuilder: queryBuilder)
        }
        
        if let groupClause = groupBy {
            result += try " GROUP BY " + groupClause.map { try $0.build(queryBuilder: queryBuilder) }.joined(separator: ", ")
        }
        
        if let havingClause = self.havingClause {
            result += try " HAVING " + havingClause.build(queryBuilder: queryBuilder)
        }
        
        if let orderClause = orderBy {
            result += try " ORDER BY " + orderClause.map { try $0.build(queryBuilder: queryBuilder) }.joined(separator: ", ")
        }
        
        if let top = top {
            result += " LIMIT \(top)"
        }
        
        if let offset = offset {
            result += " OFFSET \(offset)"
        }
        
        if let unions = unions, unions.count != 0 {
            for union in unions {
                result += try union.build(queryBuilder: queryBuilder)
            }
        }

        result = updateParameterNumbers(query: result, queryBuilder: queryBuilder)
        return result
    }

    /// Create a SELECT DISTINCT query.
    ///
    /// - Parameter fields: A list of `Field`s to select.
    /// - Parameter from: The table to select from.
    /// - Returns: A new instance of Select with `distinct` flag set.
    public static func distinct(_ fields: Field..., from table: Table) -> Select {
        var selectQuery = Select(fields: fields, from: table)
        selectQuery.distinct = true
        return selectQuery
    }
    
    /// Create a SELECT DISTINCT query.
    ///
    /// - Parameter fields: An array of `Field`s to select.
    /// - Parameter from table: The table to select from.
    /// - Returns: A new instance of Select with `distinct` flag set.
    public static func distinct(fields: [Field], from table: Table...) -> Select {
        var selectQuery = Select(fields: fields, from: table)
        selectQuery.distinct = true
        return selectQuery
    }
    
    /// Create a SELECT DISTINCT query.
    ///
    /// - Parameter fields: A list of `Field`s to select.
    /// - Parameter from: An array of tables to select from.
    /// - Returns: A new instance of Select with `distinct` flag set.
    public static func distinct(_ fields: Field..., from tables: [Table]) -> Select {
        var selectQuery = Select(fields: fields, from: tables)
        selectQuery.distinct = true
        return selectQuery
    }

    /// Create a SELECT DISTINCT query.
    ///
    /// - Parameter fields: An array of `Field`s to select.
    /// - Parameter from: An array of tables to select from.
    /// - Returns: A new instance of Select with `distinct` flag set.
    public static func distinct(fields: [Field], from tables: [Table]) -> Select  {
        var selectQuery = Select(fields: fields, from: tables)
        selectQuery.distinct = true
        return selectQuery
    }

    /// Add the HAVING clause to the query.
    ///
    /// - Parameter clause: The `Having` clause to apply.
    /// - Returns: A new instance of Select with the `Having` clause.
    public func having(_ clause: SelectionHaving) -> Select {
        var new = self
        if self.havingClause != nil {
            new.syntaxError += "Multiple having clauses. "
        } else {
            new.havingClause = clause
        }
        return new
    }
    
    
    /// Add the ORDER BY keyword to the query.
    ///
    /// - Parameter by: A list of the `OrderBy` to apply.
    /// - Returns: A new instance of Select with the ORDER BY keyword.
    public func order(by clause: OrderBy...) -> Select {
        var new = self
        if orderBy != nil {
            new.syntaxError += "Multiple order by clauses. "
        }
        else {
            new.orderBy = clause
        }
        return new
    }
    
    /// Add the GROUP BY clause to the query.
    ///
    /// - Parameter by: A list of `Column`s to group by.
    /// - Returns: A new instance of Select with the GROUP BY clause.
    public func group(by clause: Column...) -> Select {
        var new = self
        if groupBy != nil {
            new.syntaxError += "Multiple group by clauses. "
        }
        else {
            new.groupBy = clause
        }
        return new
    }
    
    /// Add the LIMIT/TOP clause to the query.
    ///
    /// - Parameter to: The limit of the number of rows to select.
    /// - Returns: A new instance of Select with the LIMIT clause.
    public func limit(to newLimit: Int) -> Select {
        var new = self
        if top != nil {
            new.syntaxError += "Multiple limits. "
        }
        else {
            new.top = newLimit
        }
        return new
    }
    
    /// Add the OFFSET clause to the query.
    ///
    /// - Parameter to: The number of rows to skip.
    /// - Returns: A new instance of Select with the OFFSET clause.
    public func offset(_ offset: Int) -> Select {
        var new = self
        if new.offset != nil {
            new.syntaxError += "Multiple offsets. "
        }
        else {
            new.offset = offset
        }
        return new
    }

    
    /// Add an SQL WHERE clause to the select statement.
    ///
    /// - Parameter conditions: The SQL WHERE clause to apply.
    /// - Returns: A new instance of Select with the WHERE clause.
    public func `where`(_ conditions: SelectionFilter) -> Select {
        var new = self
        if self.whereClause != nil {
            new.syntaxError += "Multiple where clauses. "
        } else {
            new.whereClause = conditions
        }
        return new
    }
    
    /// Add an SQL ON clause to the JOIN statement.
    ///
    /// - Parameter conditions: The `Filter` to apply.
    /// - Returns: A new instance of Select with the ON clause.
    public func on(_ conditions: Filter) -> Select {
        var new = self
        if onClause != nil || rawOnClause != nil {
            new.syntaxError += "Multiple on clauses. "
        }
        else if using != nil {
            new.syntaxError += "An on clause is not allowed with a using clause. "
        }
        else {
            new.onClause = conditions
        }
        return new
    }
    
    /// Add a raw SQL ON clause to the JOIN statement.
    ///
    /// - Parameter conditions: A String containing the SQL ON clause to apply.
    /// - Returns: A new instance of Select with the ON clause.
    public func on(_ raw: String) -> Select {
        var new = self
        if onClause != nil || rawOnClause != nil {
            new.syntaxError += "Multiple on clauses. "
        }
        else if using != nil {
            new.syntaxError += "An on clause is not allowed with a using clause. "
        }
        else {
            new.rawOnClause = raw
        }
        return new
    }

    
    /// Add an SQL USING clause to the JOIN statement.
    ///
    /// - Parameter columns: A list of `Column`s to match in the JOIN statement.
    /// - Returns: A new instance of Select with the USING clause.
    public func using(_ columns: Column...) -> Select {
        var new = self
        if using != nil {
            new.syntaxError += "Multiple using clauses. "
        }
        else if onClause != nil || rawOnClause != nil {
            new.syntaxError += "A using clause is not allowed with an on clause. "
        }
        else {
            new.using = columns
        }
        return new
    }
    
    /// Create an SQL SELECT UNION statement.
    ///
    /// - Parameter table: The second Select query used in performing the union. 
    /// - Returns: A new instance of Select corresponding to the SELECT UNION.
    public func union(_ query: Select) -> Select {
        var new = self
        if unions == nil {
            new.unions = [Union]()
        }
        new.unions!.append(.union(query))
        return new
    }

    /// Create an SQL SELECT UNION ALL statement.
    ///
    /// - Parameter table: The second Select query used in performing the union.
    /// - Returns: A new instance of Select corresponding to the SELECT UNION ALL.
    public func unionAll(_ query: Select) -> Select {
        var new = self
        if unions == nil {
            new.unions = [Union]()
        }
        new.unions!.append(.unionAll(query))
        return new
    }
    
    /// Create an SQL SELECT INNER JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT INNER JOIN.
    public func join(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .join(table)
        }
        return new
    }
    
    /// Create an SQL SELECT LEFT JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT LEFT JOIN.
    public func leftJoin(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .left(table)
        }
        return new
    }
    
    /// Create an SQL SELECT RIGHT JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT RIGHT JOIN.
    public func rightJoin(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .right(table)
        }
        return new
    }
    
    /// Create an SQL SELECT FULL JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT FULL JOIN.
    public func fullJoin(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .full(table)
        }
        return new
    }
    
    /// Create an SQL SELECT CROSS JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT CROSS JOIN.
    public func crossJoin(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .cross(table)
        }
        return new
    }
    
    /// Create an SQL SELECT NATURAL JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT NATURAL JOIN.
    public func naturalJoin(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .natural(table)
        }
        return new
    }

    /// Create an SQL SELECT NATURAL LEFT JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT NATURAL LEFT JOIN.
    public func naturalLeftJoin(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .naturalLeft(table)
        }
        return new
    }

    /// Create an SQL SELECT NATURAL RIGHT JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT NATURAL RIGHT JOIN.
    public func naturalRightJoin(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .naturalRight(table)
        }
        return new
    }

    /// Create an SQL SELECT NATURAL FULL JOIN statement.
    ///
    /// - Parameter table: The right table used in performing the join. The left table is the table field of this `Select` instance.
    /// - Returns: A new instance of Select corresponding to the SELECT NATURAL FULL JOIN.
    public func naturalFullJoin(_ table: Table) -> Select {
        var new = self
        if join != nil {
            new.syntaxError += "Multiple joins. "
        }
        else {
            new.join = .naturalFull(table)
        }
        return new
    }
}

