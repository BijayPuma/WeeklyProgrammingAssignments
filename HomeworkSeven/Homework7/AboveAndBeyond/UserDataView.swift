
import SwiftUI
import Foundation
import MapKit

struct UserDataContentView: View {
    
    var body: some View {
        
        TabView {
            UserDataView()
                .environment(DataStore())
                .tabItem {
                    Label("User Data", systemImage: "person.fill")
                }
            
            ApiDataView()
                .tabItem {
                    Label("API Data", systemImage: "network")
                }
        }
    }
}

#Preview {
    UserDataContentView()
}

    struct UserDataView: View {
        @Environment(DataStore.self) var dataStore
        
        var region: MKCoordinateRegion {
            MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(dataStore.myData?.results[0].location.coordinates.latitude ?? "-63.2827") ?? -63.2827, longitude: Double(dataStore.myData?.results[0].location.coordinates.longitude ?? "-63.2827") ?? -63.2827), span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.1))
        }
        
        var body: some View {
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: \(dataStore.myData?.results[0].name.first ?? "no first name")")
                    Text(dataStore.myData?.results[0].name.last ?? "no last name")
                }
                Text("Title: \(dataStore.myData?.results[0].name.title ?? "title")")
                Text("Gender: \(dataStore.myData?.results[0].gender ?? "no gender")")
                Text("Email: \(dataStore.myData?.results[0].email ?? "no email")")
                Text("Country: \(dataStore.myData?.results[0].location.country ?? "no country")")
                Text("State: \(dataStore.myData?.results[0].location.state ?? "no state")")
                Text("City: \(dataStore.myData?.results[0].location.city ?? "no city")")
                HStack {
                    Text("Street: ")
                    Text("\(dataStore.myData?.results[0].location.street.number ?? 1)")
                    Text("Location: \(dataStore.myData?.results[0].location.street.name ?? "no street")")
                        }
                Text("Latitude: \(dataStore.myData?.results[0].location.coordinates.latitude ?? "no latitude")")
                Text("Longitude: \(dataStore.myData?.results[0].location.coordinates.latitude ?? "no Longtitude")")
                
                Map(position: .constant(.region(region)))
                    .frame(height: 200)
            Text("Image: \(dataStore.myData?.results[0].picture.medium ?? "no image")")

            }
            .padding()
            .onAppear {
                dataStore.load()
            }
            }
        }

struct ApiDataView: View {
    @State private var users: [UserProfile] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView("Loading...")
            }
        }


    }
    


}



