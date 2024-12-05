//
//  SwiftUIView.swift
//  MyToDoList
//
//  Created by Emanuel Gonzalez on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TasksViewModel()
    @State private var isAddTaskViewPresented = false
    @State private var taskToDelete: Task? = nil
    @State private var isShowingDeleteAlert = false

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
                        .onDelete { indexSet in
                            if let index = indexSet.first {
                                taskToDelete = viewModel.tasks[index]
                                isShowingDeleteAlert = true
                            }
                        }
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
            }
            .sheet(isPresented: $isAddTaskViewPresented) {
                AddTaskView(viewModel: viewModel, isPresented: $isAddTaskViewPresented)
            }
            .alert(isPresented: $isShowingDeleteAlert) {
                Alert(
                    title: Text("Delete Task"),
                    message: Text("Are you sure you want to delete this task?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let task = taskToDelete,
                           let index = viewModel.tasks.firstIndex(where: { $0.id == task.id }) {
                            viewModel.deleteTask(at: IndexSet(integer: index))
                        }
                        taskToDelete = nil
                    },
                    secondaryButton: .cancel {
                        taskToDelete = nil
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
