
import Foundation


struct ApiListModel: Codable {
    let count: Int
    let entries: [Entry]
}

struct Entry: Codable, Hashable, Identifiable {
    var id: String { api }
    let api: String
    let description: String
    let auth: String
    let https: Bool
    let cors: String
    let link: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case api = "API"
        case description = "Description"
        case auth = "Auth"
        case https = "HTTPS"
        case cors = "Cors"
        case link = "Link"
        case category = "Category"
    }
}

@Observable
class DataModel {
  var loadApis: ApiListModel = Storage.shared.loadJsonFromBundle("apilist.json")!
}
