

import Foundation


class Storage {
  
  enum PublicApiError: Error {
    case invalidURL
    case invalidResponse
    case failedDecoding
  }
  
  static let shared = Storage()
  private let fileName = "storage.json"
  
  func fetchApiListFromNetwork() async throws -> ApiListModel {
    
    let urlString = "https://api.publicapis.org/entries"
    guard let url = URL(string: urlString) else {
      throw PublicApiError.invalidURL
    }
    let cofiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: cofiguration)
    
    let (data, response) = try await session.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
      throw PublicApiError.invalidResponse
    }
    
    do {
      let decoder = JSONDecoder()
      let publicApiResponse = try decoder.decode(ApiListModel.self, from: data)
      return publicApiResponse
    } catch {
      throw PublicApiError.failedDecoding
    }
    
  }
  
  func writeJsonToDocumentDirectory(_ jsonData: ApiListModel) {

    let encoder = JSONEncoder()
    do {
      let data = try encoder.encode(jsonData)
      if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    

        let fileURL = documentDirectory.appendingPathComponent(fileName)
        try data.write(to: fileURL)
        print("File Saved To: \(fileURL)")

      }
    } catch {
      print("Failed to write JSON to document directory \(error)")
    }
  
  }
  
  func loadJsonFromBundle(_ fileName: String) -> ApiListModel? {
    let data: Data
    print(Bundle.main.bundleURL)
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
      print("Failed to load from Bundle")
      return nil
    }
    
    do {
      data = try Data(contentsOf: file)
    } catch {
      fatalError("Couldn't load \(fileName): \(error)")
    }
    
    do {
      let decoder = JSONDecoder()
      return try decoder.decode(ApiListModel.self, from: data)
    } catch {
      fatalError("Couldn't parse \(fileName) as \(ApiListModel.self): \(error)")
    }
    
  }
  
  func loadJsonFromDocumentDirectory(fileName: String) -> ApiListModel? {
    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
      print("Failed to access the documents directory")
      return nil
    }
    let fileURL = documentDirectory.appendingPathComponent(fileName)
    do {
      let data = try Data(contentsOf: fileURL)
      let decoder = JSONDecoder()
      return try decoder.decode(ApiListModel.self, from: data)
    } catch {
      print("Failed to decode \(fileName) from documents directory \(error)")
      return nil
    }
    
  }
  
}


extension Storage {
  
  func loadApiListAsync() async throws -> ApiListModel {
    
    do {
      let apiList = try await fetchApiListFromNetwork()
      print("Data fetched from network.")
      return apiList
      
    } catch {
      print("Failed to fetch data from network: \(error)")
      if let apliList = loadJsonFromDocumentDirectory(fileName: "storage.json") {
        print("Data loaded from document directory.")
        return apliList
      } else if let apiList = loadJsonFromBundle("apilist.json") {
        print("Data loaded from bundle.")
        return apiList
      } else {
        throw error
      }
   
    }
  }
  
}
