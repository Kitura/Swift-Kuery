import XCTest
@testable import Swift_Kuery



public class MyTable : Table {
    let a = Field("a")
    let b = Field("b")
    
    public let name = "myTable"
}

class Swift_KueryTests: XCTestCase {
    
    
    func testExample() {
        
        
        let t = MyTable()
        
        // More ORM type mapping
        let _ = t.delete()
        let _ = t.select(t.a)
        let _ = t.update(values: [t.b: 2])
        
        
        
        // Underlayer
        let s1 = Select(from: t.name)

        let s2 = Select(t.a, avg(t.b) |> "B", from: t.name)
            .filter(by: ((ucase(t.a) == "KUKU") || (t.a == "lala")) && (t.b == 8))
        
        let s3 = Select(t.a, avg(t.b), from: t.name)
            .filter(by: (ucase(t.a) == "KUKU") || (t.a == "lala") && (t.b == 8))
            .grouped(by: t.a, t.b)
            .ordered(by: .ASCD(t.a), .DESC(t.a))
            .having(t.a > 1)
            .limited(to: 1)
        
        let i1 = Insert(into: t.name, values: "lalala", 5)
        let i2 = Insert(into: t.name, valueTuples: (t.a, "aa"), (t.b, "12"))
        let i3 = Insert(into: t.name, columns: [t.a, t.b], values: ["aaa", 7])
        let u1 = Update(values: [t.a: 1, t.b: 2], table: t.name)
        let d1 = Delete(table: t.name).filter(by: t.b == 1)
        
        print(s1.build(),"\n")
        print(s2.build(),"\n")
        print(s3.build(),"\n")
        print(i1.build(),"\n")
        print(i2.build(),"\n")
        print(i3.build(),"\n")
        print(u1.build(),"\n")
        print(d1.build(),"\n")

        s1.execute()
        i1.execute()
        u1.execute()
        d1.execute()
    }


    static var allTests : [(String, (Swift_KueryTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
    
    
}
