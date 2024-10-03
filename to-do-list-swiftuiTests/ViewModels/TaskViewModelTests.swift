//
//  TaskViewModelTests.swift
//  to-do-list-swiftuiTests
//
//  Created by Fernando Schulz on 01/10/24.
//

import XCTest
@testable import to_do_list_swiftui

class TaskViewModelTests: XCTestCase {
    
    var mockRepository: MockTaskRepository!
    var viewModel: TaskViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockRepository = MockTaskRepository()
        viewModel = TaskViewModel(taskRepository: mockRepository)
    }

    override func tearDownWithError() throws {
        mockRepository = nil
        viewModel = nil
        try super.tearDownWithError()
    }

    func testLoadTasks() {
        viewModel.loadTasks()
        
        XCTAssertEqual(viewModel.incompletedTasks.count, 3)
        XCTAssertEqual(viewModel.completedTasks.count, 2)
    }
    
    func testToggleTaskCompletion() {
        let taskToToggle = mockRepository.tasks[0]
        
        viewModel.toggleTaskCompletion(taskToToggle)
        
        XCTAssertTrue(mockRepository.tasks[0].isCompleted)
        XCTAssertEqual(viewModel.completedTasks.count, 3)
    }
    
    func testDeleteTask() {
        let taskToDelete = mockRepository.tasks[1]
        
        viewModel.deleteTask(taskToDelete)
        
        XCTAssertEqual(viewModel.incompletedTasks.count, 2)
        XCTAssertEqual(mockRepository.tasks.count, 4)
    }

}
