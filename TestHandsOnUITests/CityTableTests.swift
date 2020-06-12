//
//  CityTableTests.swift
//  TestHandsOnUITests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//


import XCTest
@testable import TestHandsOn

class CityTableTests: XCTestCase {
    func test_addCity_updatesTable() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-skipOnboarding"]
        app.launch()
        
        app.navigationBars["My Favorite Cities"].buttons["Add City"].tap()
        
        let textfield = app.alerts["New City"].textFields["New City TF"]
        textfield.typeText("Fortaleza")
        
        app.alerts["New City"].scrollViews.otherElements.buttons["Add"].tap()
        
        let cell = XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Fortaleza"]/*[[".cells.staticTexts[\"Fortaleza\"]",".staticTexts[\"Fortaleza\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertNotNil(cell.exists)
        
    }
    
    func addCity(app: XCUIApplication) {
        app.navigationBars["My Favorite Cities"].buttons["Add City"].tap()
        
        let textfield = app.alerts["New City"].textFields["New City TF"]
        textfield.typeText("Fortaleza")
        
        app.alerts["New City"].scrollViews.otherElements.buttons["Add"].tap()
    }
    
    func test_removeCity_updatesTable() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-skipOnboarding"]
        app.launch()
        
        app.navigationBars["My Favorite Cities"].buttons["Add City"].tap()
        
        let textfield = app.alerts["New City"].textFields["New City TF"]
        textfield.typeText("Fortaleza")
        
        app.alerts["New City"].scrollViews.otherElements.buttons["Add"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Fortaleza"]/*[[".cells.staticTexts[\"Fortaleza\"]",".staticTexts[\"Fortaleza\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["trailing0"]/*[[".cells",".buttons[\"Delete\"]",".buttons[\"trailing0\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let cell = tablesQuery.staticTexts["Fortaleza"]
        XCTAssertFalse(cell.exists)
        
    }
}
