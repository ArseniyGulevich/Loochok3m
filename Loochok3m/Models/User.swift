import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var nickname: String
    var email: String
    var password: String
    var userImage: String
    var description: String
}
