//
//  TaskRow.swift
//  

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var taskStore: TaskStore
    var task: Task

    @State private var animate = false

    var body: some View {
        NavigationLink(destination: TaskDetailView(task: self.binding(for: task))) {
            HStack {
           Text(task.title)
           Spacer()
           Image(systemName: task.isCompleted ? "checkmark.square" : "square")
               .foregroundColor(task.isCompleted ? .green : .red)
               .scaleEffect(animate ? 1.5 : 1)
               .rotation3DEffect(
                   .degrees(animate ? 360 : 0),
                                         axis: (x: 0.0, y: 1.0, z: 0.0)
               )
               .onTapGesture {
                   animate = true
                   withAnimation(.easeInOut(duration: 0.2)) {
                       taskStore.toggleTaskCompletion(task: task)
                   }
                   DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                       animate = false
                   }
               }
               .transition(.asymmetric(insertion: .scale, removal: .opacity))
               
          }
          .font(.title3)
          .bold()
          .padding([.top, .bottom], 15)
          .padding([.leading, .trailing], 10)
        }
    }

    private func binding(for task: Task) -> Binding<Task> {
        guard let taskIndex = taskStore.tasks.firstIndex(where: { $0.id == task.id }) else {
            fatalError("Task not found")
        }
        return $taskStore.tasks[taskIndex]
    }
}









