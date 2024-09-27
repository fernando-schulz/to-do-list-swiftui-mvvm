//
//  TaskRepositoryMock.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 21/09/24.
//

import Foundation

class MockTaskRepository: TaskRepository {
    
    override func loadCompletedTasks() -> [Task] {
        return mockTasksCompleted
    }
    
    override func loadIncompleteTasks() -> [Task] {
        return mockTasksNotCompleted
    }
}
