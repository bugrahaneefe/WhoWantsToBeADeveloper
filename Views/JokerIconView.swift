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
    
    @State private var flashingGreen = false

    var body: some View {
        Button(action: {
            if !isUsed {
                action()

                flashingGreen = true
                flashEffect()
            }
        }) {
            
            Circle()
                .fill(isUsed ? (flashingGreen ? Color.green : Color.gray) : Color.orange)
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
        .animation(.easeInOut(duration: 0.2), value: flashingGreen)
    }
}

extension JokerIcon {
    
    // flashing effect when jokers first selected
    private func flashEffect() {
        var flashCount = 0
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            withAnimation {
                flashingGreen.toggle()
            }
            flashCount += 1
            if flashCount >= 5 {
                timer.invalidate()
                withAnimation {
                    flashingGreen = false
                }
            }
        }
    }
}
