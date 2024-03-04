//
//  ContentView.swift
//  WeekFive
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyTasksView()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
