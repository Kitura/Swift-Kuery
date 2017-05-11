/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import XCTest
import Glibc
@testable import SwiftKueryTests

srand(UInt32(time(nil)))

// http://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift
extension MutableCollection where Indices.Iterator.Element == Index {
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(random() % numericCast(unshuffledCount))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

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
