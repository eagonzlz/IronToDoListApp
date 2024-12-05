//
//  TaskListView.swift
//  MyToDoList
//
//  Created by Emanuel Gonzalez on 12/5/24.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TasksViewModel()
    @State private var showingAddTask = false

    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.tasks, id: \.id) { Task in
                    NavigationLink(destination: TaskDetailView(task: Task.wrappedValue, viewModel: viewModel)) {
                        TaskRowView(task: Task)
                    }

                    }
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddTask = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskView(viewModel: viewModel, isPresented: $showingAddTask)
            }
        }
    }


struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}


#Preview {
    TaskListView()
}
