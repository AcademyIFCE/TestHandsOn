//
//  ViewTests.swift
//  ApplicationTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import XCTest
@testable import TestHandsOn

class ViewControllerTests: XCTestCase {
    var sut: ViewController!
    
    override func setUp() {
        //Given
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ViewController.self))
        sut = (storyboard.instantiateInitialViewController() as! ViewController)
        sut.loadViewIfNeeded()
    }

    func test_testeLabel_onAppear_toBeTimeToShine() {
        
        //when
        sut.viewWillAppear(true)
        
        //then
        XCTAssertEqual(sut.testeLabel.text, "Time to shine")
    }
    
    func test_view_onLoad_outletsConnected() {
        XCTAssertNotNil(sut.testeLabel)
        XCTAssertNotNil(sut.myButton)
    }
    
    func test_view_onDissapear_buttonByeBye() {
        sut.viewWillDisappear(true)
        XCTAssertEqual(sut.myButton.titleLabel?.text, "bye bye")
    }
    
    override func tearDown() {
        sut = nil
    }
}
