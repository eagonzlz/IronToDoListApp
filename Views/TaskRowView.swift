//
//  TaskRowView.swift
//  MyToDoList
//
//  Created by Emanuel Gonzalez on 12/5/24.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .blue : .gray)
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            Text(task.title)
                .font(.headline)
                .strikethrough(task.isCompleted, color: .gray)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: .constant(Task(title: "This is a task", isCompleted: false)))
    }
}
