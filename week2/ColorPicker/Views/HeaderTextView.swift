

import SwiftUI

struct HeaderTextView: View {
  let text: String
  
    var body: some View {
      Text(text)
        .bold()
        .font(.largeTitle)
        .foregroundStyle(Color("TextColor"))
    }
}

#Preview {
  HeaderTextView(text: "Test Text")
}
