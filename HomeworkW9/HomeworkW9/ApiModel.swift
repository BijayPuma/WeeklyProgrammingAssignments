//
//  ApiModel.swift
//  HomeworkW9
//
//  Created by Bijay Rai on 3/25/24.
//

 
import Foundation

struct PexelsSearchResponse: Decodable {
    let photos: [Photo]
}

struct Photo: Decodable, Identifiable {
    let id: Int
    let src: PhotoSource
}

struct PhotoSource: Decodable {
    let large: URL
    let large2x: URL
}

struct AlertMessage: Identifiable {
    var id: UUID = UUID()
    var message: String
}

class PexelsAPIService {
    private var apiKeys: String {
        guard let filePath = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let value = plist.object(forKey: "PexelsAPIKey") as? String else {
                  fatalError("Couldn't find key 'PexelsAPIKey' in 'APIKeys.plist'.")
              }
        return value
    }
        let apiKey = "iH923E6dLQeBhUimtwJqKy4decpctDEa9Rf7DbtZ9ghQ8VkXeMwF7tGI"


    private let baseUrl = "https://api.pexels.com/v1/search"

    func searchPhotos(query: String) async throws -> PexelsSearchResponse {
        guard let url = URL(string: baseUrl + "?query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                  throw URLError(.badServerResponse)
              }

        return try JSONDecoder().decode(PexelsSearchResponse.self, from: data)
    }

}


extension Bundle {
    func apiKey(forResource name: String) -> String? {
        if let url = self.url(forResource: name, withExtension: "plist"),
           let data = try? Data(contentsOf: url),
           let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
           let key = result["PexelsAPIKey"] as? String {
            return key
        }
        return nil
    }
}

