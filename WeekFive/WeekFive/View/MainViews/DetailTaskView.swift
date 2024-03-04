//
//  DetailTaskView.swift
//  WeekFive
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI


struct DetailTaskView: View {
    @Environment(ModelData.self) var taskData
    
    var task: Task
  
    var taskIndex: Int {
        taskData.tasks.firstIndex(where: { $0.id == task.id }) ?? 0
    }
    
    var body: some View {
        
            Form {
                Section("Task title") {
                    Text(task.title)
                        .bold()
                }
                Section("Notes") {
                    if task.note.isEmpty {
                        Text("Notes")
                            .foregroundStyle(.gray)
                    } else {
                        Text(task.note)
                    }
                }
                Toggle("Completed", isOn: Binding(
                    get: { taskData.tasks[taskIndex].isCompleted },
                    set: { newValue in
                        taskData.tasks[taskIndex].isCompleted = newValue
                         }
                ))
            }
    }
}
                   
#Preview {
     DetailTaskView(task: ModelData().tasks[0])
        .environment(ModelData())
}


