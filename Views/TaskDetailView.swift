//
//  TaskDetailView.swift
//  MyToDoList
//
//  Created by Emanuel Gonzalez on 12/5/24.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    @StateObject var viewModel: TasksViewModel
    @Environment(\.dismiss) var dismiss

    @State private var isEditing: Bool = false
    @State private var editedTitle: String = ""
    @State private var newIsCompleted: Bool = false
    @State private var showingDeleteAlert: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if isEditing {
                TextField("Title", text: $editedTitle)
                    .font(.headline)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text(task.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Task Detail")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if isEditing {
                    Button("Save") {
                        let trimmedTitle = editedTitle.trimmingCharacters(in: .whitespaces)
                        if !trimmedTitle.isEmpty {
                            viewModel.updateTask(task: task, title: trimmedTitle)
                            isEditing = false
                        }
                    }
                    .disabled(editedTitle.trimmingCharacters(in: .whitespaces).isEmpty)

                    Button("Cancel") {
                        isEditing = false
                    }
                } else {
                    Button("Edit") {
                        editedTitle = task.title
                        newIsCompleted = task.isCompleted
                        isEditing = true
                    }

                    Button(action: {
                        showingDeleteAlert = true
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(id: UUID(), title: "Sample Task", isCompleted: false), viewModel: TasksViewModel())
    }
}


