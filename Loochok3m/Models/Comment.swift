import Foundation
import SwiftUI

struct Comment: Codable, Identifiable {
    let id = UUID().uuidString
    var postID: String
    var userID: String
    var date: String
    var body: String
}
