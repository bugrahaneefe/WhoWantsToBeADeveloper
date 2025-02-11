import SwiftUI

struct JokerStatus {
    var usedFiftyFifty: Bool = false
    var usedAskAI: Bool = false
    
    var usedX2: Bool = false
    /// Whether X2 is available or not
    var x2Unlocked: Bool = false
}

struct JokerIcon: View {
    let label: String
    let isUsed: Bool
    let action: () -> Void
        
    var body: some View {
        Button(action: {
            if !isUsed {
                action()
            }
        }) {
            Circle()
                .fill(isUsed ? Color.gray : Color.orange)
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                )
                .overlay(
                    Text(label)
                        .font(.subheadline)
                        .monospaced()
                        .foregroundColor(.white)
                )
                .shadow(radius: 15)
        }
        .disabled(isUsed)
    }
}
