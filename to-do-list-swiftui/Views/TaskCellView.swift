//
//  TaskCellView.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 19/09/24.
//

import SwiftUI

struct TaskCellView: View {
    
    let task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                .foregroundColor(.white)
        }
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellView(task: mockTask)
            .background(.black)
            .previewLayout(.sizeThatFits)
    }
}
