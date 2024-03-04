//
//  Task.swift
//  WeekFive
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

