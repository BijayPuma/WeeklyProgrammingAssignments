//
//  DetailMyTaskView.swift
//  Week5Homework
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct DetailTaskView: View {
    @Environment(ModelData.self) var taskData
    
    var task: Task
    @Binding var isCompleted: Bool
  
    var taskIndex: Int? {
        taskData.tasks.firstIndex(where: { $0.id == task.id })
    }
    
    var body: some View {
        if let taskIndex = taskIndex {
            Form {
                Section("Task title") {
                    Text(taskData.tasks[taskIndex].title)
                        .bold()
                }
                Section("Notes") {
                    if task.note.isEmpty {
                        Text("Notes")
                            .foregroundStyle(.gray)
                    } else {
                        Text(taskData.tasks[taskIndex].note)
                    }
                }
                Toggle("Completed", isOn: Binding(
                    get: { taskData.tasks[taskIndex].isCompleted },
                    set: { newValue in
                        taskData.tasks[taskIndex].isCompleted = newValue
                    }
                ))
            }
        } else {
            Text("Task not found")
        }
    }
}
                   
#Preview {
    return  DetailTaskView(task: ModelData().tasks[0], isCompleted: .constant(false))
        .environment(ModelData())
}


