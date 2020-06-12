//
//  SieveTests.swift
//  TestHandsOnAsyncTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import XCTest
@testable import TestHandsOn

class SieveTests: XCTestCase {

    func test_sieve_calculatePrimesTo100_shouldBe25() {
        //given
        let max = 100
        let expec = expectation(description: "calculatingPrimes")
        
        //when
        Sieve.calculatePrimes(upTo: max) { numbersOfPrimes in
            let result = numbersOfPrimes
            //then
            XCTAssertEqual(result.count, 25)
            expec.fulfill()
        }
        
        wait(for: [expec], timeout: 15)
    }
}
