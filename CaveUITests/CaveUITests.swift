//
//  CaveUITests.swift
//  CaveUITests
//
//  Created by Aliia Satbakova on 23.11.2023.
//

import XCTest

import XCTest

final class CaveUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    // MARK: - Text
    
    func testSetsText() {
        // Найдем элементы Text
        let setSizeText = app.staticTexts["Set the size"]
        let setLimitsText = app.staticTexts["Set the limits"]
        // Проверим, что Text существует на экране
        XCTAssertTrue(setSizeText.exists)
        XCTAssertTrue(setLimitsText.exists)
    }
    
    // MARK: - Steppers
    
    func testStepperAndText() {
        // Найдем элементы Stepper
        let rowsStepper = app.steppers["RowsStepper"]
        let columnsStepper = app.steppers["ColumnsStepper"]
        let chanceStepper = app.steppers["ChanceStepper"]
        let birthLimitStepper = app.steppers["BirthLimitStepper"]
        let deathLimitStepper = app.steppers["DeathLimitStepper"]
        let autoStepTimeStepper = app.steppers["AutoStepTimeStepper"]
        
        // Проверим, что Stepper существует на экране
        XCTAssertTrue(rowsStepper.exists)
        XCTAssertTrue(columnsStepper.exists)
        XCTAssertTrue(chanceStepper.exists)
        XCTAssertTrue(birthLimitStepper.exists)
        XCTAssertTrue(deathLimitStepper.exists)
        XCTAssertTrue(autoStepTimeStepper.exists)
    }
    
    // MARK: - Buttons
    
    func testClearButton() {
        // Найдем элемент Button
        let clearButton = app.buttons["Clear"]
        // Проверим, что Button существует на экране
        XCTAssertTrue(clearButton.exists)
        // Проверим, что Button нажимается
        clearButton.tap()
    }
    
    func testGenerateButton() {
        // Найдем элемент Button
        let generateButton = app.buttons["Generate"]
        // Проверим, что Button существует на экране
        XCTAssertTrue(generateButton.exists)
        // Проверим, что Button нажимается
        generateButton.tap()
    }
    
    func testStepButton() {
        // Найдем элемент Button
        let stepButton = app.buttons["Step"]
        // Проверим, что Button существует на экране
        XCTAssertTrue(stepButton.exists)
        // Проверим, что Button нажимается
        stepButton.tap()
    }
    
    func testAutoButton() {
        // Найдем элементы Button
        let autoButton = app.buttons["Auto"]
        // Проверим, что Button существует на экране
        XCTAssertTrue(autoButton.exists)
        // Проверим, что Button нажимается
        autoButton.tap()
    }
    
    func testCaveSceneExists() {
        // Найдем элемент Scene
        let caveArea = app.otherElements["CaveArea"]
        // Проверим, что при запусе Scene нет на экране
        XCTAssertFalse(caveArea.exists)
    }
    
}
