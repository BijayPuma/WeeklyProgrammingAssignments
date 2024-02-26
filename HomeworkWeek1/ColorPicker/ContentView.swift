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
                    Slider(value: $redValue, in: 0.0...255.0)
                    Text("255")
                }
                Text("Green \(Int(greenValue))")
                HStack{
                    Slider(value: $greenValue, in: 0.0...255.0)
                    Text("255")
                }
                
                Text("Blue \(Int(blueValue))")
                HStack{
                    Slider(value: $blueValue, in: 0.0...255.0)
                    Text("255")
                }
            }

    
            Button {
                self.setColor = Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
                print(redValue)
            }label: {
                Text("Set Color")
                    .frame(width: 100, height: 40)
                    .background(
                        ZStack {
                            Color.blue
                            LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.7), .clear]), startPoint: .top, endPoint: .bottom)
                        }
                    )
                    .foregroundColor(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black.opacity(0.5), lineWidth: 2)
                      
                    }
                 
                   
            }
        }
        .padding()
    }

}


#Preview {
    ContentView()
}
