import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let options: [String]
    let correctAnswer: String
    let level: Int
    let image: Image?
}
