import Foundation

// Keys for KeyChain to save bearer token
let account = "su.brf.apps.AuthSUI309"

struct BearerToken: Codable {
    let bearerToken: String
}
