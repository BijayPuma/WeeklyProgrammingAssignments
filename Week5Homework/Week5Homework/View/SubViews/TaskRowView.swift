//
//  TaskRowView.swift
//  Week5Homework
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: Task
    @Binding var isCompleted: Bool
    
    var body: some View {
        NavigationLink {
            DetailTaskView(task: task, isCompleted: $isCompleted)
        } label: {
            HStack {
                Text(task.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                Spacer()
                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                        .foregroundStyle(task.isCompleted ? .green : .red)
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 0.5)
        }
    }
}

#Preview {
    return TaskRowView(task: ModelData().tasks[0], isCompleted: .constant(false))
}

