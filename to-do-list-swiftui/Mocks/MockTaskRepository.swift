//
//  TaskRepositoryMock.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 21/09/24.
//

import Foundation

class MockTaskRepository: TaskRepository {
    
    var tasks: [Task] = mockTasksNotCompleted + mockTasksCompleted
    
    override func loadCompletedTasks() -> [Task] {
        return tasks.filter { $0.isCompleted }
    }
    
    override func loadIncompleteTasks() -> [Task] {
        return tasks.filter { !$0.isCompleted }
    }
    
    override func setIsCompletedTask(task: Task, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted = isCompleted
        }
    }
    
    override func removeTask(task: Task) {
        tasks.removeAll { $0.id == task.id }
    }
    
    override func addTask(task: Task) {
        tasks.append(task)
    }
}
