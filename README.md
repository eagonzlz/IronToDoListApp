# Iron To-Do List Application

## Project Description
The **To-Do List Application** is a task management tool built using SwiftUI. It allows users to create, view, edit, and delete tasks in a simple and user-friendly interface. This app is designed to enhance productivity and organization with features like swipe-to-delete, task details, and easy navigation.

---

## Screenshots

### Task List View
Displays all tasks and allows navigation to task details or swipe-to-delete functionality.

![TaskRowView](https://github.com/user-attachments/assets/6db3e0fc-08ca-4de8-a1ff-b416e8825b59)

### Add Task View
A form to input and save a new task.

![AddTaskView](https://github.com/user-attachments/assets/8438ddae-cd17-43b6-9aea-e4547f0cfb8b)

### Task Detail View
Shows detailed task information with options to edit or delete.

![TaskDetailView](https://github.com/user-attachments/assets/b7db27c4-93e3-43b5-97e9-469d0436f0cf)

### Profile View
Displays user profile and app-related settings.

![ProfileView](https://github.com/user-attachments/assets/4a628834-d749-451a-8327-72c2d40180b9)

---

## Usage Instructions
1. Tap the (+) button to add a task
2. Tap on a task to edit it.
3. Swipe on a task to delete it.
4. Tap the checkbox to mark the task as complete!

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

---

## Challenges and Solutions

### Challenge 1: Managing Bindings Between Views
Passing data incorrectly caused UI inconsistencies. Adding `@Binding` to enable proper two-way data flow between parent and child views fixed the problem.

### Challenge 2: Task Deletion with Confirmation
Swipe-to-delete accidentally removed tasks, so a confirmation alert was added to ensure intentional deletions.

### Challenge 3: Navigating to Task Details
Crashes occurred when navigating without correctly passing required data. Ensured the `task` and `viewModel` were correctly initialized and passed to `TaskDetailView`.

---

## Future Enhancements
1.  **Reminders and Notifications**:
   - Allow users to set reminders for tasks with local notifications.
2. **Customizable Categories**:
   - Organize tasks by categories or tags for better sorting.
3. **Dark Mode Support**:
   - Add full support for dark mode to improve accessibility.
4. **Profile Features**:
   - Expand the **Profile View** with user settings, themes, and account management.

---
