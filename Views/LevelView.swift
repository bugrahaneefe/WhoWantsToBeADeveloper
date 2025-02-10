import SwiftUI

struct LevelView: View {
    let levels = [
        "1......Rookie Developer",
        "2......Intern Developer",
        "3......Junior Developer",
        "4......Mid-level Developer",
        "5......Senior Developer",
        "6......Tech Lead",
        "7......Apple Developer"
    ]
    
    var currentLevel: Int
    
    var body: some View {
        VStack {
            ForEach(levels.indices.reversed(), id: \.self) { index in
                let levelText = levels[index]
                
                Text(levelText)
                    .foregroundColor(index + 1 == currentLevel ? Color.orange : Color.white)
                    .font(.headline)
                    .padding(5)
                    .monospaced()
            }
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.mint]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
        )
        .padding()
    }
}
