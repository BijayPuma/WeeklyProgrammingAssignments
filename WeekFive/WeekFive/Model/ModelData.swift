//
//  ModelData.swift
//  WeekFive
//
//  Created by Bijay Rai on 2/25/24.
//

import Foundation

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
