

import Foundation

class Storage {
  
  static let shared = Storage()
  private let fileName = "storage.json"
  
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
      fatalError("Couldn't find \(fileName) in app bundle")
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
  
  func loadApiList(fileName: String) -> ApiListModel? {
    if let apiList = loadJsonFromBundle(fileName) {
      return apiList
    } else if let apiList = loadJsonFromBundle(fileName) {
      return apiList
    } else {
      print("data can not be loaded")
      return nil
    }
  }
  
  
}

