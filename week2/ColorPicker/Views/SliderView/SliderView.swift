

import SwiftUI

struct SliderView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
    var body: some View {
      
      VStack {
        RedSliderView(redColor: $redColor)
        GreenSliderView(greenColor: $greenColor)
        BlueSliderView(blueColor: $blueColor)
      }
    }
}

#Preview {
  SliderView(redColor: .constant(250), greenColor: .constant(100), blueColor: .constant(50))
}
