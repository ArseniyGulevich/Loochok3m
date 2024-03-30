import Foundation
import SwiftUI

struct Category: Codable, Identifiable {
    let id = UUID().uuidString
    var name: String
}
