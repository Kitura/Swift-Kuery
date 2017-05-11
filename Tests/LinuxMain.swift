import XCTest
@testable import SwiftKueryTests

XCTMain([
     testCase(TestAggregateFunctions.allTests.shuffled()),
     testCase(TestAlias.allTests.shuffled()),
     testCase(TestFilterAndHaving.allTests.shuffled()),
     testCase(TestInsert.allTests.shuffled()),
     testCase(TestJoin.allTests.shuffled()),
     testCase(TestParameters.allTests.shuffled()),
     testCase(TestQueryResult.allTests.shuffled()),
     testCase(TestRaw.allTests.shuffled()),
     testCase(TestSchema.allTests.shuffled()),
     testCase(TestSelect.allTests.shuffled()),
     testCase(TestSpecialOperators.allTests.shuffled()),
     testCase(TestSubqueries.allTests.shuffled()),
     testCase(TestSubquery.allTests.shuffled()),
     testCase(TestSyntaxError.allTests.shuffled()),
     testCase(TestUpdate.allTests.shuffled()),
])
