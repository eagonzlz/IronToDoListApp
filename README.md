# Iron To-Do List Application

## Project Description
The **To-Do List Application** is a task management tool built using SwiftUI. It allows users to create, view, edit, and delete tasks in a simple and user-friendly interface. This app is designed to enhance productivity and organization with features like swipe-to-delete, task details, and easy navigation.

---

## Screenshots

### Task List View
Displays all tasks and allows navigation to task details or swipe-to-delete functionality.

![Task List View Screenshot](./Screenshots/TaskListView.png)

### Add Task View
A form to input and save a new task.

![Add Task View Screenshot](./Screenshots/AddTaskView.png)

### Task Detail View
Shows detailed task information with options to edit or delete.

![Task Detail View Screenshot](./Screenshots/TaskDetailView.png)

### Profile View
(Optional) Displays user profile and app-related settings.

![Profile View Screenshot](./Screenshots/ProfileView.png)

---

## Usage Instructions
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/todo-app.git
   ```

2. **Open the project in Xcode**:
   ```bash
   cd todo-app
   open ToDoApp.xcodeproj
   ```

3. **Run the application**:
   - Select a simulator or a connected device.
   - Press **Command + R** to build and run the app.

---

## Features Implemented
- **Task Management**:
  - Add new tasks via the **Add Task View**.
  - Edit tasks in the **Task Detail View**.
  - Delete tasks using swipe-to-delete with confirmation alerts.
- **Navigation**:
  - Seamless transitions between views using `NavigationLink`.
- **Shared State Management**:
  - Uses `TasksViewModel` to manage tasks across views.
- **Intuitive UI**:
  - Clean and responsive interface optimized for all screen sizes.

---

## Challenges and Solutions

### Challenge 1: Managing Bindings Between Views
- **Problem**: Passing data incorrectly caused UI inconsistencies.
- **Solution**: Implemented `@Binding` to enable proper two-way data flow between parent and child views.

### Challenge 2: Task Deletion with Confirmation
- **Problem**: Swipe-to-delete could accidentally remove tasks.
- **Solution**: Added a confirmation alert to ensure intentional deletions.

### Challenge 3: Navigating to Task Details
- **Problem**: Crashes occurred when navigating without correctly passing required data.
- **Solution**: Ensured the `task` and `viewModel` were correctly initialized and passed to `TaskDetailView`.

---

## Future Enhancements
1. **Data Persistence**:
   - Save tasks between app sessions using Core Data or UserDefaults.
2. **Reminders and Notifications**:
   - Allow users to set reminders for tasks with local notifications.
3. **Customizable Categories**:
   - Organize tasks by categories or tags for better sorting.
4. **Dark Mode Support**:
   - Add full support for dark mode to improve accessibility.
5. **Profile Features**:
   - Expand the **Profile View** with user settings, themes, and account management.

---
