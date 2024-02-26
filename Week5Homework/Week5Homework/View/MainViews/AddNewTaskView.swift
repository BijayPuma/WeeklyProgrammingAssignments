//
//  AddNewTaskView.swift
//  Week5Homework
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct AddNewTaskView: View {
    @Environment(ModelData.self) var taskModel
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var note: String = ""
    @Binding var isCompleted: Bool
    
    @Binding var tasks: [Task]
    @Binding var showingSheet: Bool
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Task Title") {
                    TextField("Title", text: $title, prompt: Text("Title"))
                }
                
                Section("Notes") {
                    TextField("Note", text: $note, prompt: Text("Notes"))
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Add") {
                        let newTask = Task(title: title, note: note, isCompleted: isCompleted)
                        taskModel.tasks.append(newTask)
                        showingSheet = false
                    }
                }
                
            }
            .navigationTitle("Adding New Task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    @State var tasks = [Task(title: "Sample Task", note: "This is a note", isCompleted: false)]
    return AddNewTaskView(isCompleted: .constant(false), tasks: .constant(tasks), showingSheet: .constant(true))
        .environment(ModelData())
}
