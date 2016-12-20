import XCTest
@testable import SwiftKueryTests

XCTMain([
     testCase(TestSelect.allTests),
     testCase(TestInsert.allTests),
     testCase(TestUpdate.allTests),
     testCase(TestAlias.allTests),
     testCase(TestParameters.allTests),
     testCase(TestJoin.allTests),
     testCase(TestSyntaxError.allTests),
     testCase(TestSubquery.allTests),
     testCase(TestAggregateFunctions.allTests),
     testCase(TestSpecialOperators.allTests),
     testCase(TestFilterAndHaving.allTests),
     testCase(TestSubqueries.allTests),
     testCase(TestQueryResult.allTests),
])
