
import SwiftUI

struct ButtonSetView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  
  let roundedRectCornerRadius = CGFloat(20)
  let text: String
    var body: some View {
      Button {
        foregroundColor = Color(red: redColor / Constants.maxRGBValue, green: greenColor / Constants.maxRGBValue, blue: blueColor / Constants.maxRGBValue)
      }label: {
        Text(text)
          .bold()
          .padding()
          .background(Color("ButtonColor"))
          .clipShape(RoundedRectangle(cornerRadius: roundedRectCornerRadius))
          .overlay {
            RoundedRectangle(cornerRadius: roundedRectCornerRadius)
              .strokeBorder(Color("ButtonTextColor"), lineWidth: 2)
          }
          .foregroundStyle(Color("ButtonTextColor"))
      }
    }
}

#Preview {
  ButtonSetView(redColor: .constant(0), greenColor: .constant(0), blueColor: .constant(0), foregroundColor: .constant(.blue), text: "Set Color")
}
