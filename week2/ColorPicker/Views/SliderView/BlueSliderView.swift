
import SwiftUI

struct BlueSliderView: View {
  @Binding var blueColor: Double
  
    var body: some View {
      VStack {
        SliderTextView(text: "Blue")
        HStack {
          Slider(value: $blueColor, in: 0...255)
            .tint(Color("BlueColor"))
            .frame(width: Constants.sliderWidth)
          Text("\(Int(blueColor.rounded()))")
            .frame(width: Constants.sliderTextWidth)
            .foregroundStyle(Color("TextColor"))
        }
      }
    }
}

#Preview {
  BlueSliderView(blueColor: .constant(50))
}
