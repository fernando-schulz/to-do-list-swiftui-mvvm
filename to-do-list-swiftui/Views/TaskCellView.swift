//
//  TaskCellView.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 19/09/24.
//

import SwiftUI

struct TaskCellView: View {
    
    let task: Task
    let toggleCompletion: (Task) -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(Color("TextColor"))
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .opacity(0.7)
            }
            
            Spacer()
            
            Button(action: {
                toggleCompletion(task)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundColor(Color("IconColor"))
            }
        }
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellView(task: mockTask, toggleCompletion: {_ in
            print("Toggle completion called in preview")
        })
            .background(Color("Purple"))
            .previewLayout(.sizeThatFits)
    }
}
