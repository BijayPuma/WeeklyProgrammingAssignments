

import SwiftUI


struct ApiListView: View {


  @State private var apiList: ApiListModel?
  @State private var showAlert = false
  @State private var isLoading = false
  
    var body: some View {
      
      NavigationStack {
        if isLoading {
          VStack {
            ProgressView()
            Text("Loading APIs...")
          }
        } else if let apiList = apiList {
          
          List(apiList.entries ) { entry in
            NavigationLink {
              ApiDetailView(entry: entry)
            } label: {
              Text(entry.api)
            }
          }
          .navigationTitle("API Names")
        } else {
          Text("No data Available")
        }
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
    isLoading = true
    do {
      apiList = try await Storage.shared.loadApiListAsync()
    } catch {
        showAlert = true
    }
    isLoading = false
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
