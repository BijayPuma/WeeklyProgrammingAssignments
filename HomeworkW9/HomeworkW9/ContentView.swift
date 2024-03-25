//
//  ContentView.swift
//  HomeworkW9
//
//  Created by Bijay Rai on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     SearchView()
    }
}

#Preview {
   ContentView()
}

struct SearchView: View {
    @State private var searchText = ""
    @State private var photos: [Photo] = []
    @State private var isLoading = false
    @State private var alertMessage: AlertMessage? = nil

    private let apiService = PexelsAPIService()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit(search)

                if isLoading {
                    ProgressView()
                } else {
                    List(photos) { photo in
                        NavigationLink(destination: DetailView(photo: photo)) {
                            Text("Photo ID: \(photo.id)")
                        }
                    }
                }
            }
            .navigationTitle("Pexels Search")
            .alert(item: $alertMessage) { alertMessage in
                Alert(title: Text("Error"), message: Text(alertMessage.message), dismissButton: .default(Text("OK")))
            }

        }
    }

    private func search() {
        Task {
            isLoading = true
            do {
                let response = try await apiService.searchPhotos(query: searchText)
                photos = response.photos
            } catch {
                alertMessage = AlertMessage(message: error.localizedDescription)
            }
            isLoading = false
        }
    }

}


struct DetailView: View {
    let photo: Photo

    var body: some View {
        AsyncImage(url: photo.src.large) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .aspectRatio(contentMode: .fit)
        .navigationTitle("Photo Detail")
    }
}
