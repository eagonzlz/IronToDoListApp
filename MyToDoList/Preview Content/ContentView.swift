//
//  SwiftUIView.swift
//  MyToDoList
//
//  Created by Emanuel Gonzalez on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TasksViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    @State private var isAddTaskViewPresented = false
    @State private var isProfileViewPresented = false

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.tasks.isEmpty {
                    Text("No tasks yet!")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding()
                } else {
                    List {
                        ForEach($viewModel.tasks) { $task in
                            NavigationLink(destination: TaskDetailView(task: task, viewModel: viewModel)) {
                                TaskRowView(task: $task)
                            }
                        }
                        .onDelete(perform: viewModel.deleteTask)
                    }
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddTaskViewPresented = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isProfileViewPresented = true
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
            .sheet(isPresented: $isAddTaskViewPresented) {
                AddTaskView(viewModel: viewModel, isPresented: $isAddTaskViewPresented)
            }
            .sheet(isPresented: $isProfileViewPresented) {
                ProfileView(viewModel: profileViewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
