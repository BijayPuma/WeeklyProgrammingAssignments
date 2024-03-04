//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var taskStore = TaskStore()
   
    @State private var searchText = ""
    
    var body: some View {
        TabView {
          
            NavigationStack {
                TaskListView(taskStore: taskStore, showCompleted: false, searchText: $searchText)
                    .navigationTitle("Tasks")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NewTaskButtonView(taskStore: taskStore)
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search Tasks")
                
            }
            .tabItem {
                Label("Tasks", systemImage: "list.bullet.circle")
            }
            
            NavigationStack {
                TaskListView(taskStore: taskStore, showCompleted: true, searchText: $searchText)
                    .navigationTitle("Completed")
                    .searchable(text: $searchText, prompt: "Search Completed Tasks")
            }
            .tabItem {
                Label("Completed", systemImage: "checkmark.circle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
