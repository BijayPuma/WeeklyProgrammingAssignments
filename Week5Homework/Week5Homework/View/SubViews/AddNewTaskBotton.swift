//
//  AddNewTaskBotton.swift
//  Week5Homework
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct AddNewTaskBotton: View {
    
   
    @State private var showingSheet = false
    @State var tasks: [Task]
    @Binding var isCompleted: Bool
    
    var body: some View {
        Button {
            showingSheet = true
        } label: {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                Text("New Task")
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .sheet(isPresented: $showingSheet) {
            AddNewTaskView(isCompleted: $isCompleted, tasks: $tasks, showingSheet: $showingSheet)
        }
    }
}

#Preview {
    AddNewTaskBotton(tasks: [ModelData().tasks[0]], isCompleted: .constant(false))
}


