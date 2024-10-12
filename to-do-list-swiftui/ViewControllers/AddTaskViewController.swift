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
    @State private var showErrorAlert: Bool = false
    
    var body: some View {
        VStack {
            Text(viewModel.viewTitle)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color("DarkPurple"))
            
            Text(viewModel.txtTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("Purple"))
            
            TextField(viewModel.txtTitle, text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
                .accessibilityIdentifier("Task Title")
            
            Text(viewModel.txtDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("Purple"))
            
            TextField(viewModel.txtDescription, text: $viewModel.description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
                .accessibilityIdentifier("Task Description")
            
            Button(action: {
                viewModel.addTask()
                
                if viewModel.errorMessage != nil {
                    showErrorAlert = true
                    return
                }
                
                showModal = false
            }) {
                Text(viewModel.txtButton)
                    .foregroundColor(Color("TextColor"))
                    .fontWeight(.semibold)
            }
            .frame(width: 175, height: 40)
            .background(Color("Purple"))
            .cornerRadius(20)
            .accessibilityIdentifier("Save Task")
            
            Spacer()
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Erro"),
                message: Text(viewModel.errorMessage ?? "Ocorreu um erro."),
                dismissButton: .default(Text("OK"), action: {
                    viewModel.errorMessage = nil
                    showErrorAlert = false
                })
            )
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
