//
//  TaskModel.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 19/09/24.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String
    var isCompleted: Bool = false
    var date: Date
}
