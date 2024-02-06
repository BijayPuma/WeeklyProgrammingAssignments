
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
