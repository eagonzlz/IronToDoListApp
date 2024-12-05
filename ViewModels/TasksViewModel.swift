//
//  TaskViewModel.swift
//  MyToDoList
//
//  Created by Emanuel Gonzalez on 12/5/24.
//


import SwiftUI

class TasksViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    private let taskKey = "task_key"

    init() {
        loadTasks()
    }

    // Add a new task
    func addTask(title: String, isCompleted: Bool) {
        let newTask = Task(title: title)
        tasks.append(newTask)
        saveTasks()
    }

    // Delete task at specified offsets
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }

    func updateTask(task: Task, title: String) {
            if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                tasks[index].title = title
                tasks[index].isCompleted = false
                saveTasks()
            }
        }
    
    // Save task to UserDefaults
    private func saveTasks() {
        do {
            let encodedData = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodedData, forKey: taskKey)
        } catch {
            print("Error encoding task: \(error)")
        }
    }

    // Load task from UserDefaults
    private func loadTasks() {
        if let savedData = UserDefaults.standard.data(forKey: taskKey) {
            do {
                tasks = try JSONDecoder().decode([Task].self, from: savedData)
            } catch {
                print("Error decoding task: \(error)")
                tasks = []
            }
        }
    }
}
