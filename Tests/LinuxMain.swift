import XCTest
@testable import SwiftKueryTests

XCTMain([
     testCase(TestAggregateFunctions.allTests),
     testCase(TestAlias.allTests),
     testCase(TestFilterAndHaving.allTests),
     testCase(TestInsert.allTests),
     testCase(TestJoin.allTests),
     testCase(TestParameters.allTests),
     testCase(TestQueryResult.allTests),
     testCase(TestRaw.allTests),
     testCase(TestSelect.allTests),
     testCase(TestSpecialOperators.allTests),
     testCase(TestSubqueries.allTests),
     testCase(TestSubquery.allTests),
     testCase(TestSyntaxError.allTests),
     testCase(TestUpdate.allTests),
])
