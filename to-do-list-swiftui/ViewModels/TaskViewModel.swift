//
//  TaskViewModel.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 18/09/24.
//

import Foundation

class TaskViewModel: ObservableObject {
    
    @Published var title: String = "Tasks"
    @Published var completedTasks: [Task] = []
    @Published var incompletedTasks: [Task] = []
    @Published var showModalAddTask: Bool = false
    
    private var taskRepository: TaskRepository
    
    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
        loadTasks()
    }
    
    func loadTasks() {
        completedTasks = taskRepository.loadCompletedTasks()
        incompletedTasks = taskRepository.loadIncompleteTasks()
    }
    
    func toggleTaskCompletion(_ task: Task) {
        taskRepository.setIsCompletedTask(task: task, isCompleted: !task.isCompleted)
        loadTasks()
    }
    
    func toggleShowModalAddTask() {
        showModalAddTask.toggle()
    }
    
    func deleteTask(_ task: Task) {
        taskRepository.removeTask(task: task)
        loadTasks()
    }
}
