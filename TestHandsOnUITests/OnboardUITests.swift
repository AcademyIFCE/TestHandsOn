//
//  OnboardUITests.swift
//  TestHandsOnUITests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import XCTest
@testable import TestHandsOn

class OnboardUITests: XCTestCase {
    
    func test_onboardButtons_actionables() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-reset", "-noAnimations"]
        app.launch()
        
        
        let collectionViewsQuery = XCUIApplication().collectionViews
        let firstButton = collectionViewsQuery.buttons["Próximo"]
        XCTAssertTrue(firstButton.isHittable)
        firstButton.tap()
        
        let secondButton = collectionViewsQuery.buttons["Próximo"]
        _ = secondButton.waitForExistence(timeout: 1)
        XCTAssertTrue(secondButton.isHittable)
        secondButton.tap()
        
        let lastButton = collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Começar"]/*[[".cells.buttons[\"Começar\"]",".buttons[\"Começar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        _ = lastButton.waitForExistence(timeout: 1)
        XCTAssertTrue(lastButton.isHittable)
        
    }
}
