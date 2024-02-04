
import SwiftUI

struct ColorDisplayRectView: View {
  @Binding var foregroundColor: Color
  let sqrLengthColorDisplay = CGFloat(350)
  let colorDisplayStroke = CGFloat(6)
  
    var body: some View {
      RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadius)
        .frame(width: sqrLengthColorDisplay, height: sqrLengthColorDisplay)
        .foregroundColor(foregroundColor)
        .overlay {
          RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadius)
            .strokeBorder(Color("StrokeColor"), lineWidth: colorDisplayStroke)
        }
        .padding(.bottom)
     
    }
}

#Preview {
  ColorDisplayRectView(foregroundColor: .constant(.black))
}

