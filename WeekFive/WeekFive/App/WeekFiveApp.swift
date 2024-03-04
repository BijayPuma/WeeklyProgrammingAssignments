//
//  WeekFiveApp.swift
//  WeekFive
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

@main
struct WeekFiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
    }
}
