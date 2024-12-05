//
//  AddTaskView.swift
//  MyToDoList
//
//  Created by Emanuel Gonzalez on 12/5/24.
//

import SwiftUI

struct AddTaskView: View {
    @StateObject var viewModel = TasksViewModel()
    @Binding var isPresented: Bool

    @State private var title: String = ""
    @State private var isCompleted: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }
            }
            .navigationTitle("Add New Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                        if !trimmedTitle.isEmpty {
                            viewModel.addTask(title: trimmedTitle, isCompleted: false)
                            isPresented = false
                        }
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(viewModel: TasksViewModel(), isPresented: .constant(true))
    }
}
