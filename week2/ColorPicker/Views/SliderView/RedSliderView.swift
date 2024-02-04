

import SwiftUI

struct RedSliderView: View {
  @Binding var redColor: Double
  
    var body: some View {
      VStack {
        SliderTextView(text: "Red")
        HStack {
          Slider(value: $redColor, in: 0...255)
            .tint(Color("RedColor"))
            .frame(width: Constants.sliderWidth)
          Text("\(Int(redColor.rounded()))")
            .frame(width: Constants.sliderTextWidth)
            .foregroundStyle(Color("TextColor"))
        }
      }
    }
}

#Preview {
  RedSliderView(redColor: .constant(250))
}
