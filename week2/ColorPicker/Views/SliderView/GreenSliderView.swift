

import SwiftUI

struct GreenSliderView: View {
  @Binding var greenColor: Double
  
    var body: some View {
      VStack {
        SliderTextView(text: "Green")
        HStack {
          Slider(value: $greenColor, in: 0...255)
            .tint(Color("GreenColor"))
            .frame(width: Constants.sliderWidth)
          Text("\(Int(greenColor.rounded()))")
            .frame(width: Constants.sliderTextWidth)
            .foregroundStyle(Color("TextColor"))
        }
      }
    }
}

#Preview {
  GreenSliderView(greenColor: .constant(100))
}
