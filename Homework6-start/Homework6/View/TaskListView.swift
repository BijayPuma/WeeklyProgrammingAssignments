//
//  TaskListView.swift
//  

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskStore: TaskStore
    var showCompleted: Bool
    @Binding var searchText: String

    var filteredTasks: [Task] {
        taskStore.tasks.filter { task in
            (task.isCompleted == showCompleted) &&
            (searchText.isEmpty || task.title.localizedCaseInsensitiveContains(searchText))
        }
    }

    var body: some View {
        List(filteredTasks) { task in
            TaskRowView(taskStore: taskStore, task: task)
        }
    }
}


#Preview {
    TaskListView(taskStore: TaskStore(), showCompleted: false, searchText: .constant(""))
}
