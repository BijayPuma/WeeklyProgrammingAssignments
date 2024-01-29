//
//  ContentView.swift
//  ColorPicker
//
//  Created by Bijay Rai on 1/28/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = 47.0
    @State private var greenValue = 127.0
    @State private var blueValue = 247.0
    @State private var setColor = Color(red: 47.5 / 255, green: 127.5 / 255, blue: 233.5 / 255)
    
    
    var body: some View {
        
        VStack {
         Text("Color Picker")
                .font(.title)
            
         RoundedRectangle(cornerRadius: 0)
                .frame(width: 300, height: 300)
                .foregroundColor(setColor)

            VStack {
                Text("Red \(Int(redValue))")
                HStack{
                    Slider(value: $redValue, in: 1.0...255.0)
                    Text("255")
                }
                Text("Green \(Int(greenValue))")
                HStack{
                    Slider(value: $greenValue, in: 1.0...255.0)
                    Text("255")
                }
                
                Text("Blue \(Int(blueValue))")
                HStack{
                    Slider(value: $blueValue, in: 1.0...255.0)
                    Text("255")
                }
            }

    
            Button {
                self.setColor = Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
            }label: {
                Text("Set Color")
                    .frame(width: 100, height: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
    }

}

#Preview {
    ContentView()
}
