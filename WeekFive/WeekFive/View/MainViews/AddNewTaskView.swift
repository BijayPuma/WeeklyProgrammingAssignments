//
//  AddNewTaskView.swift
//  WeekFive
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct AddNewTaskView: View {
    
    @Environment(ModelData.self) var taskModel
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var note = ""
    @State private var isCompleted = false
    
    @Binding var showingSheet: Bool
  
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Task Title") {
                    TextField("Title", text: $title, prompt: Text("Title"))
                }
                
                Section("Notes") {
                    TextEditor(text: $note)
                        .frame(minHeight: 100, alignment: .leading)
                        .padding(3)
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
                    .disabled(title.isEmpty)
                }
                
            }
            .navigationTitle("Adding New Task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddNewTaskView(showingSheet: .constant(false))
        .environment(ModelData())
}

