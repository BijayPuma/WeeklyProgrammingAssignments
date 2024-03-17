
import Foundation

@Observable
class DataStore {
    static let shared = Storage()
    var myData: MyData?
    private let fileName = "savedDocument.json"
    
    private func readJSONFromFile(bundle Filename: String) -> MyData? {
        if let url = Bundle.main.url(forResource: Filename, withExtension: nil) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                return try decoder.decode(MyData.self, from: data)
                 
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    private func readJSONFromDocumentDirectory(fileName: String) -> MyData? {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(fileName)
        
        do {
            let decoder = JSONDecoder()
            
            let data = try Data(contentsOf: fileURL)
            return try decoder.decode(MyData.self, from: data)
            
        } catch {
            print(error)
        }
        return nil
    }
    
    private func writeJSONToDocumentDirectory(_ myData: MyData) {
         let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
        do {
            let encoder = JSONEncoder()
           let data = try encoder.encode(myData)
            try data.write(to: url)
            
        } catch {
            print(error)
        }
    }
    
    func load() {
        if let bundleData = readJSONFromFile(bundle: "week7aboveandbeyond.json") {
            self.myData = bundleData
        } else if let documentData = readJSONFromDocumentDirectory(fileName: "savedDocument.json") {
            self.myData = documentData
        } else {
            print("The file cannot be found")
        }
    }
}


