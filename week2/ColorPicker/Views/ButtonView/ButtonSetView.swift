
import SwiftUI

struct ButtonSetView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  
    var body: some View {
      
      Button {
        
        foregroundColor = Color(red: redColor / Constants.maxRGBValue, green: greenColor / Constants.maxRGBValue, blue: blueColor / Constants.maxRGBValue)
        
      }label: {
        ButtonTextView(text: "Set Color")
      }
    }
}

#Preview {
  ButtonSetView(redColor: .constant(0), greenColor: .constant(0), blueColor: .constant(0), foregroundColor: .constant(.blue))
}
