
// TODO: define ValueType
public typealias ValueType = Any


// Connection
public struct ConnectionOptions {
}

public protocol Connection {
    var conectionOptions : ConnectionOptions {get}
    
    func execute(query: Query, onCompletion: (QueryResult))
    func execute(query: Query, parameters: ValueType..., onCompletion: (QueryResult))
}


// Query
public class QueryError {}
public class QueryResult {
    public var error : QueryError?
    public var rows :[[String:ValueType]]?
    // other possible results
}

public class Query {
    public let table : Table
    
    var description : String {
        return ""
    }
    
    init(table: Table) {
        self.table = table
    }
    
    public func build() -> String {
        return description
    }
    
}


// Table
public class Table {
    public let name : String
    
    public init(name: String) {
        self.name = name
    }
}


// Select
public class Select : Query {
    public var fields : [Field]?
    public var whereClause : Where?
    public var distinct = false
    public var top : Int?
    public var orderBy : OrderBy?
    public var groupBy : GroupBy?
    public var having : Having?
    
    override var description : String {
        var result =  "SELECT "
        if let fields = fields where fields.count != 0 {
            var columns = ""
            for field in fields {
                columns += field.description + ","
            }
            result += String(columns.characters.dropLast())
        }
        else {
            result += " *"
        }
        result += " FROM " + table.name
        if let whereClause = whereClause {
            result += " WHERE " + whereClause.predicate
        }
        return result
    }
    
    public init(_ fields: Field..., from table: Table){
        super.init(table: table)
        self.fields = fields
    }
}


// Insert
public class Insert : Query {
    public var columns : [Field]?
    public var values : [ValueType]
    
    public init(into table: Table, values: ValueType...) {
        self.values = values
        super.init(table: table)
    }
    
    public init(into table: Table, columns: [Field], values: [ValueType]) {
        self.values = values
        self.columns = columns
        super.init(table: table)
    }
    
    public init(into table: Table, valueTuples: (Field, ValueType)...) {
        columns = Array<Field>()
        values = Array<ValueType>()
        for (column, value) in valueTuples {
            columns!.append(column)
            values.append(value)
        }
        
        super.init(table: table)
    }
    
    override var description : String {
        var result =  "INSERT INTO " + table.name + " "
        if let columns = columns where columns.count != 0 {
            result += "("
            for column in columns {
                result += column.description + ","
            }
            result = String(result.characters.dropLast()) + ") "
        }
        result += "VALUES ("
        for value in values {
            //            if value is String {
            //                add '' around it
            //            }
            result += "\(value)" + ","
        }
        result = String(result.characters.dropLast()) + ")"
        
        return result
    }
}


// Field: column and function
public struct Field {
    enum Function : String {
        case avg = "AVG"
        case count = "COUNT"
        case countDistinct = "COUNT(DISTINCT"
        case first = "FIRST"
        case last = "LAST"
        //...
        case ucase = "UCASE"
        //...
        func description(name: String) -> String {
            return self.rawValue + "(" + name + ")"
        }
    }
    
    public let name : String
    private var function : Function?
    public var description : String {
        if let function = function {
            return function.description(name: name)
        }
        return name
    }
    
    public init(_ name: String) {
        self.name = name
    }
    
    init(_ function: Function, _ name: String) {
        self.name = name
        self.function = function
    }
}

public func avg(_ field: Field) -> Field {
    return Field(.avg, field.name)
}

public func count(_ field: Field) -> Field {
    return Field(.count, field.name)
}

public func ucase(_ field: Field) -> Field {
    return Field(.ucase, field.name)
}

// ... other functions



// Where
public class Where {
    var predicate : String
    
    public init(_ predicate: String) {
        self.predicate = predicate
    }
}

public func == (lhs: Field, rhs: String) -> Where {
    return Where(lhs.description + " == \"" + rhs + "\"")
}

public func == (lhs: Field, rhs: Int) -> Where {
    return Where(lhs.description + " == \"" + String(rhs) + "\"")
}

public func || (lhs: Where, rhs: Where) -> Where {
    return Where("(" + lhs.predicate + ") OR (" + rhs.predicate + ")")
}

public func && (lhs: Where, rhs: Where) -> Where {
    return Where("(" + lhs.predicate + ") AND (" + rhs.predicate + ")")
}

// other operators and other types



// Other
public class OrderBy {
}

public class GroupBy {
}

public class Having {
}



// Example
public class MyTable : Table {
    let a = Field("a")
    let b = Field("b")
}

let t = MyTable(name: "mytable")

let s1 = Select(from: t)
s1.build()

let s2 = Select(t.a, avg(t.b), from: t)
s2.whereClause = ((ucase(t.a) == "KUKU") || (t.a == "lala")) && (t.b == 8)
s2.build()

let s3 = Select(t.a, avg(t.b), from: t)
s3.whereClause = (ucase(t.a) == "KUKU") || (t.a == "lala") && (t.b == 8)
s3.build()

let i1 = Insert(into: t, values: "lalala", 5)
i1.build()
let i2 = Insert(into: t, values: "aaa", 7)
i2.columns = [t.a, t.b]
i2.build()
let i3 = Insert(into: t, valueTuples: (t.a, "aa"), (t.b, "12"))
i3.build()
let i4 = Insert(into: t, columns: [t.a, t.b], values: ["aaa", 7])
i4.build()


