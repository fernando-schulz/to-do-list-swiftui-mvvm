//
//  AddTaskViewControllerTests.swift
//  to-do-list-swiftuiTests
//
//  Created by Fernando Schulz on 10/10/24.
//

import XCTest

class AddTaskViewControllerTests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddNewTask() throws {
        app.buttons["Add Task"].tap()
        
        let titleField = app.textFields["Task Title"]
        titleField.tap()
        titleField.typeText("Teste Adicionar Tarefa")
        
        let descriptionField = app.textFields["Task Description"]
        descriptionField.tap()
        descriptionField.typeText("Teste Descrição Adicionar Tarefa")
        
        app.buttons["Save Task"].tap()
        
        XCTAssertTrue(app.staticTexts["Teste Adicionar Tarefa"].exists)
    }

}
