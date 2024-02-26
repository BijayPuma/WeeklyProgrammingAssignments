//
//  IsCompletedButton.swift
//  Week5Homework
//
//  Created by Bijay Rai on 2/25/24.
//

import SwiftUI

struct IsCompletedButton: View {
    @State var isCompeleted: Bool
    
    var body: some View {
        Button {
            isCompeleted.toggle()
        } label: {
            Label("IsCompeleted", systemImage: isCompeleted ? "square.fill" : "square")
                .labelStyle(.iconOnly)
                .foregroundStyle(isCompeleted ? .green : .red)
        }
    }
}

#Preview {
    IsCompletedButton(isCompeleted: false)
}
