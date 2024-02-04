
import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = Constants.initialRedColorValue
  @State private var greenColor: Double = Constants.initialGreenColorValue
  @State private var blueColor: Double = Constants.initialBlueColorValue
  @State private var foregroundColor = Color(red: Constants.initialRedColorValue, green: Constants.initialGreenColorValue, blue: Constants.initialBlueColorValue)

  var body: some View {

    ZStack {
      Color("BackgroundColor").ignoresSafeArea()
      VStack {
        HeaderTextView(text: "Color Picker")
        ColorDisplayRectView(foregroundColor: $foregroundColor)
        SliderView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor)
    
        ButtonSetView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
      }
     .padding(20)
    }

  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
