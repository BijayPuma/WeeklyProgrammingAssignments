
import SwiftUI



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
    
        ButtonSetView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
      }
      .padding()
    }
  }
}

#Preview {
  ColorPickerLandscapeView(redColor: .constant(100), greenColor: .constant(233), blueColor: .constant(33), foregroundColor: .constant(.red))
}
