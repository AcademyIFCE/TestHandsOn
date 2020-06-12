//
//  CalculatorTests.swift
//  ApplicationTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import XCTest
@testable import TestHandsOn

class CalculatorTests: XCTestCase {

    func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
        XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
    }
    
    func test_calculator_division10by3_quotient3Remainde1() {
        //given
        let dividend = 10
        let divisor = 3
        
        //when
        let result = Calculator.divisionRemainder(of: dividend, dividedBy: divisor)
        
        //then
        verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
    }
    
    
    func test_calculator_division7by2_quotient3Remainde1() {
        //given
        let dividend = 10
        let divisor = 3
        
        //when
        let result = Calculator.divisionRemainder(of: dividend, dividedBy: divisor)
        
        //then
        verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
    }
}
