//
//  AddNewTaskBotton.swift
//  WeekFive
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct AddNewTaskBotton: View {
    
   
    @State private var showingSheet = false
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
            AddNewTaskView(showingSheet: $showingSheet)
        }
    }
}

#Preview {
    AddNewTaskBotton(isCompleted: .constant(false))
}


