

import SwiftUI

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
  
      ButtonSetView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
    }
   .padding(20)
  }
}


#Preview {
  ColorPickerPortraitView(redColor: .constant(23), greenColor: .constant(111), blueColor: .constant(215), foregroundColor: .constant(.green))
}
