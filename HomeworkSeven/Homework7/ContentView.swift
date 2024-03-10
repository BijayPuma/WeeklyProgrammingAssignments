

import SwiftUI

struct ContentView: View {
  var dataModel = DataModel()
  
  var body: some View {
    
    ApiListView(dataModel: dataModel)
      .onAppear {
        let dummyData = ApiListModel(count: 1, entries: [Entry(api: "Example API", description: "This is a test", auth: "None", https: true, cors: "yes", link: "https://example.com", category: "Testing")])

        Storage.shared.writeJsonToDocumentDirectory(dummyData)
                }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
