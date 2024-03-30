import Foundation

struct UserM: Codable {
    let id: Int
    let username: String
    let password: String
    let secretResponse: String
    let token: String
}
