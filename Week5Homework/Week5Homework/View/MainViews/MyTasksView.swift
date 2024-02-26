//
//  MyTasksView.swift
//  Week5Homework
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct MyTasksView: View {
    
    @Environment(ModelData.self) var taskData
    @State private var isCompleted = false

   
    var body: some View {
        
        NavigationStack {

            VStack {
                ScrollView {
                    ForEach(taskData.tasks) { task in
                        TaskRowView(task: task, isCompleted: $isCompleted)
                    }
                }
                AddNewTaskBotton(tasks: [taskData.tasks[0]], isCompleted: $isCompleted)
            }
            .navigationTitle("My Tasks")
            .padding()
            
        }
    }
}

    #Preview {
        MyTasksView()
            .environment(ModelData())
    }


