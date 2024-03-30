import Foundation
import SwiftUI

struct Post: Codable, Identifiable {
    let id = UUID().uuidString
    var userID: String
    var createdAt: String
    var type: String
    var title: String
    var description: String
    var postImage: String
    var categoryID: String
    var tagsID: [String]
}
