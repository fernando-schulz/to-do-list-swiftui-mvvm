//
//  TaskRepository.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 21/09/24.
//

import Foundation

class TaskRepository {
    private let persistence: Persistence
    private let key = "tasks"
    private let keyId = "taskId"
    
    init(persistence: Persistence = UserDefaultsPersistence()) {
        self.persistence = persistence
    }
    
    func saveTasks(tasks: [Task]) {
        do {
        let tasksData = try JSONEncoder().encode(tasks)
        persistence.saveData(data: tasksData, forKey: key)
        } catch {
            print("Ocorreu um erro ao salvar as tarefas. Log: \(error)")
        }
    }
    
    func loadTasks() -> [Task] {
        guard let tasksData = persistence.loadData(forKey: key) else { return [] }
        do {
            return (try JSONDecoder().decode([Task].self, from: tasksData))
        } catch {
            print("Ocorreu um erro ao carregar as tarefas. Log: \(error)")
            return []
        }
    }
    
    func loadCompletedTasks() -> [Task] {
        return loadTasks().filter{ $0.isCompleted }
    }
    
    func loadIncompleteTasks() -> [Task] {
        return loadTasks().filter{ !$0.isCompleted }
    }
    
    func addTask(task: Task) {
        var tasks = loadTasks()
        tasks.append(task)
        saveTasks(tasks: tasks)
    }
    
    func removeTask(task: Task) {
        var tasks = loadTasks()
        tasks.removeAll { $0 == task }
        saveTasks(tasks: tasks)
    }
    
    func setIsCompletedTask(task: Task, isCompleted: Bool) {
        var tasks = loadTasks()
        if let index = tasks.firstIndex(of: task) {
            tasks[index].isCompleted = isCompleted
            tasks[index].date = Date()
            saveTasks(tasks: tasks)
        }
    }
    
    func getNextId() -> Int {
        let currentId = persistence.loadId(forKey: keyId) ?? 0
        let nextId = currentId + 1
        persistence.saveId(id: nextId, forKey: keyId)
        
        return nextId
    }
}
