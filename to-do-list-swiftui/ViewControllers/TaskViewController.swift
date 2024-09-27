//
//  ContentView.swift
//  to-do-list-swiftui
//
//  Created by Fernando Schulz on 14/08/24.
//

import SwiftUI

struct TaskViewController: View {
    
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Spacer()
                    Image("HeaderTaskImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                    Text(viewModel.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextColor"))
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: 220)
            
            Spacer()
            
            VStack() {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        viewModel.toggleShowModalAddTask()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $viewModel.showModalAddTask) {
                        AddTaskViewController(
                            viewModel: {
                                let addTaskViewModel = AddTaskViewModel(taskRepository: TaskRepository())
                                addTaskViewModel.onTaskAdded = {
                                    viewModel.loadTasks()
                                }
                                return addTaskViewModel
                            }(),
                            showModal: $viewModel.showModalAddTask
                        )
                    }
                }
                .padding(.horizontal, 21)
                .padding(.vertical, 2)
                
                List {
                    Section() {
                        ForEach(viewModel.incompletedTasks) { task in
                            TaskCellView(task: task, toggleCompletion: { updatedTask in
                                withAnimation {
                                    viewModel.toggleTaskCompletion(updatedTask)
                                }
                            })
                        }
                    }
                    .listRowBackground(Color.clear)
                    
                    if !viewModel.completedTasks.isEmpty {
                        Section(header: VStack {
                            Text("Tarefas Completadas")
                                .foregroundColor(Color("TextColor"))
                            Divider()
                                .background(Color("TextColor"))
                        }
                        ) {
                            ForEach(viewModel.completedTasks) { task in
                                TaskCellView(task: task, toggleCompletion: { updatedTask in
                                    withAnimation {
                                        viewModel.toggleTaskCompletion(updatedTask)
                                    }
                                })
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.clear)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Purple"))
            .cornerRadius(30)
            .shadow(radius: 30)
        }
        .ignoresSafeArea()
        .background(Color("DarkPurple"))
    }
}

struct TaskViewController_Previews: PreviewProvider {
    static var previews: some View {
        TaskViewController(viewModel: TaskViewModel(taskRepository: MockTaskRepository()))
    }
}
