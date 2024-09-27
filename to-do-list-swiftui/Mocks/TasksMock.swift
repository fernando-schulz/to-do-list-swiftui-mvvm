//
//  TasksMock.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 19/09/24.
//

import Foundation

let mockTask: Task = Task(id: 1, title: "Comprar mantimentos", description: "Comprar frutas, vegetais e leite", isCompleted: false, date: Date())

let mockTasksNotCompleted: [Task] = [
    Task(id: 1, title: "Comprar mantimentos", description: "Comprar frutas, vegetais e leite", isCompleted: false, date: Date()),
    Task(id: 2, title: "Enviar relatório", description: "Enviar o relatório final para o gerente", isCompleted: false, date: Date().addingTimeInterval(60 * 60 * 24)),
    Task(id: 3, title: "Estudar SwiftUI", description: "Ler tutoriais e praticar SwiftUI", isCompleted: false, date: Date().addingTimeInterval(60 * 60 * 48))
]

let mockTasksCompleted: [Task] = [
    Task(id: 4, title: "Fazer exercícios", description: "Treino de corrida e musculação", isCompleted: true, date: Date().addingTimeInterval(-60 * 60 * 24)),
    Task(id: 5, title: "Reunião semanal", description: "Participar da reunião de planejamento semanal", isCompleted: true, date: Date().addingTimeInterval(-60 * 60 * 48))
]
