
import SwiftUI

struct ColorDisplayRectView: View {
  @Binding var foregroundColor: Color
  private let colorDisplayStroke: CGFloat = 6
  
    var body: some View {
      RoundedRectangle(cornerRadius: Constants.roundedRectCornerRadius)
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

