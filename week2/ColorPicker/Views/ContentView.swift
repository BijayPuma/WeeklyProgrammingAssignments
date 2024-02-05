
import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = Constants.initialRedColorValue
  @State private var greenColor: Double = Constants.initialGreenColorValue
  @State private var blueColor: Double = Constants.initialBlueColorValue
  @State private var foregroundColor = Color(red: Constants.initialRedColorValue, green: Constants.initialGreenColorValue, blue: Constants.initialBlueColorValue)
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass

  var body: some View {

    ZStack {
      Color("BackgroundColor").ignoresSafeArea()
      
      if horizontalSizeClass == .compact && verticalSizeClass == .regular {
        
        ColorPickerPortraitView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
      } 
      else
      
      {
        ColorPickerLandscapeView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
      }

    }

  }
}


struct ColorPickerPortraitView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  
  var body: some View {
    VStack {
      HeaderTextView(text: "Color Picker")
      ColorDisplayRectView(foregroundColor: $foregroundColor)
      SliderView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor)
  
      ButtonSetView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor, text: "Set Color")
    }
   .padding(20)
  }
}


struct ColorPickerLandscapeView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  var body: some View {
    HStack {
      VStack {
        HeaderTextView(text: "Color Picker")
        ColorDisplayRectView(foregroundColor: $foregroundColor)
      }
      .padding()
      VStack {
        SliderView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor)
    
        ButtonSetView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor, text: "Set Color")
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
