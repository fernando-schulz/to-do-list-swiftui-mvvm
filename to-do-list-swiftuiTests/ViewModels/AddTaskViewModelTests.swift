//
//  AddTaskViewModelTests.swift
//  to-do-list-swiftuiTests
//
//  Created by Fernando Schulz on 08/10/24.
//

import XCTest
@testable import to_do_list_swiftui

class AddTaskViewModelTests: XCTestCase {
    
    var mockRepository: MockTaskRepository!
    var viewModel: AddTaskViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRepository = MockTaskRepository()
        viewModel = AddTaskViewModel(taskRepository: mockRepository)
    }

    override func tearDownWithError() throws {
        mockRepository = nil
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func testAddTask() {
        let id = mockRepository.getNextId()
        let taskToAdd = Task(id: id, title: "Teste Unitário", description: "Teste descrição de teste unitário")
        mockRepository.addTask(task: taskToAdd)
        XCTAssertEqual(mockRepository.loadIncompleteTasks().count, 4)
    }

}
