

import SwiftUI


struct ApiListView: View {
   var dataModel: DataModel
  
    var body: some View {
      
      NavigationStack {
        List(dataModel.loadApis.entries) { entry in
          NavigationLink {
            ApiDetailView(entry: entry)
          } label: {
            Text(entry.api)
          }
        }
        .navigationTitle("API Names")
      }
    }
}

#Preview {
  ApiListView(dataModel: .init())
}


struct ApiDetailView: View {
  var entry: Entry
  
  var body: some View {
    List {
      Section("Details") {
        Text("Description: \(entry.description)")
        Text("Auth: \(entry.auth.isEmpty ? "None" : entry.auth)")
        Text("HTTPS: \(entry.https ? "True" : "False")")
        Text("CORS: \(entry.cors)")
        Text("Category: \(entry.category)")
        if let url = URL(string: entry.link) {
          Link("API Link", destination: url)
        }

      }
    }
  }
}
