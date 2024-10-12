//
//  AddTaskViewModel.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 24/09/24.
//

import Foundation

class AddTaskViewModel: ObservableObject {
    
    @Published var viewTitle: String = "Adicionar Tarefa"
    @Published var txtTitle: String = "Título"
    @Published var txtDescription: String = "Descrição"
    @Published var txtButton: String = "Salvar"
    @Published var errorMessage: String? = nil
    
    @Published var title: String = ""
    @Published var description: String = ""
    
    private var taskRepository: TaskRepository
    
    var onTaskAdded: (() -> Void)?
    
    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
    }
    
    func addTask() {
        if title.isEmpty || description.isEmpty {
            errorMessage = "Por favor, informe o título e a descrição da tarefa."
            return
        }
        
        let id = taskRepository.getNextId()
        let newTask = Task(id: id, title: title, description: description)
        taskRepository.addTask(task: newTask)
        
        //Notifica a TaskViewModel da adição de uma nova tarefa
        onTaskAdded?()
    }
    
}
