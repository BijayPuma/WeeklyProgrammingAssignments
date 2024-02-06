
import SwiftUI

struct ButtonTextView: View {
  
  let text: String
  private let roundedRectCornerRadius: CGFloat = 20
  
  var body: some View {
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

#Preview {
  ButtonTextView(text: "Set Color")
}
