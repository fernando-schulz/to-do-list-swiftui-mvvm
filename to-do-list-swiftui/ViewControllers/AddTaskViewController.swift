//
//  AddTaskViewController.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 24/09/24.
//

import SwiftUI

struct AddTaskViewController: View {
    
    @ObservedObject var viewModel: AddTaskViewModel
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Text(viewModel.viewTitle)
                .font(.title3)
                .fontWeight(.semibold)
            
            Text(viewModel.txtTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(viewModel.txtTitle, text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
            
            Text(viewModel.txtDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(viewModel.txtDescription, text: $viewModel.description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            Button(action: {
                viewModel.addTask()
                showModal = false
            }) {
                Text(viewModel.txtButton)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct AddTaskViewController_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskPreview()
    }
}

struct AddTaskPreview: View {
    @State private var showModal = true // Alterar para true se você quiser visualizar o modal

    var body: some View {
        AddTaskViewController(viewModel: AddTaskViewModel(taskRepository: MockTaskRepository()), showModal: $showModal)
    }
}
