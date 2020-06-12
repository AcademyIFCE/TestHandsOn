//
//  ConverterTests.swift
//  ApplicationTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import XCTest

@testable import TestHandsOn

class ConverterTests: XCTestCase {

    func test_converter_fanrenheintToCelsius_waterFusion() {
        //given
        let sut = Converter()
        let input1 = 32.0
        
        //When
        let output1 = sut.convertToCelsius(farenheit: input1)
        
        //Then
        XCTAssertEqual(output1, 0, accuracy: 0.001)
    }
    
    func test_converter_fanrenheintToCelsius_waterBoiling() {
        //given
        let sut = Converter()
        let input1 = 212.0
        
        //When
        let output1 = sut.convertToCelsius(farenheit: input1)
        
        //Then
        XCTAssertEqual(output1, 100, accuracy: 0.001)
    }
}
