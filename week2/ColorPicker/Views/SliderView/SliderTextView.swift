
import SwiftUI

struct SliderTextView: View {
  let text: String
  
    var body: some View {
        Text(text)
        .font(.title2)
    }
}

#Preview {
    SliderTextView(text: "Red")
}
