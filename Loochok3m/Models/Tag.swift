import Foundation
import SwiftUI

struct Tag: Codable, Identifiable {
    let id = UUID().uuidString
    var name: String
}
