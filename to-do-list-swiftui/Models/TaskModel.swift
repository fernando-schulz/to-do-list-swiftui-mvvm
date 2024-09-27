//
//  TaskModel.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 19/09/24.
//

import Foundation

struct Task: Codable, Equatable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var isCompleted: Bool = false
    var date: Date
    
    init(id: Int, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = false
        self.date = Date()
    }
    
    init(id: Int, title: String, description: String, isCompleted: Bool = false, date: Date = Date()) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.date = date
    }
}
