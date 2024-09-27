//
//  TaskRepositoryProtocol.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 21/09/24.
//

import Foundation

protocol TaskRepositoryProtocol {
    func loadCompletedTasks() -> [Task]
    func loadIncompleteTasks() -> [Task]
}
