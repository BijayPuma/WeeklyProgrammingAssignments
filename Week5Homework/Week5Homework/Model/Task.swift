//
//  Task.swift
//  Week5Homework
//
//  Created by Bijay Rai on 2/25/24.
//

import Foundation
import SwiftUI


struct Task: Identifiable {
    var id = UUID()
    var title: String
    var note: String
    var isCompleted: Bool
}


@Observable
class ModelData {
    var tasks: [Task] = [
        Task(title: "Task1", note: "", isCompleted: false),
        Task(title: "Task2", note: "Hello world", isCompleted: true),
        Task(title: "Task3", note: "", isCompleted: false),
        Task(title: "Task4", note: "Note 4", isCompleted: true),
        Task(title: "Task5", note: "", isCompleted: false),
    ]
}
