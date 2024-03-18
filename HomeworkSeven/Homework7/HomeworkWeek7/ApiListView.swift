

import SwiftUI


struct ApiListView: View {


  @State private var apiList: ApiListModel?
  @State private var showAlert = false
  
    var body: some View {
      
      NavigationStack {
        List(apiList?.entries ?? []) { entry in
            NavigationLink {
              ApiDetailView(entry: entry)
            } label: {
              Text(entry.api)
            }
          }
          .navigationTitle("API Names")
      }
      .task {
        await loadData()
      }
      .alert("Error", isPresented: $showAlert) {
        Button("Ok", role: .cancel) { }
      } message: {
        Text("Failed to load API list")
      }
      
    }
  
  @MainActor func loadData() async {
    do {
      apiList = try await Storage.shared.loadApiListAsync()
    } catch {
        showAlert = true
    }
  }
  
}

#Preview {
  ApiListView()
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
