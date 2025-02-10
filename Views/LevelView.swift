import SwiftUI

struct LevelView: View {
    let levels = [
        "1..........Rookie Developer",
        "2..........Intern Developer",
        "3..........Junior Developer",
        "4..........Mid-level Developer",
        "5..........Senior Developer",
        "6..........Tech Lead",
        "7..........Apple Developer"
    ]
    
    var currentLevel: Int
    
    var body: some View {
        VStack {
            Text("Level Chart")
                .font(.title)
                .padding()
            
            ForEach(0..<levels.count, id: \.self) { index in
                let levelText = levels[index]
                HStack {
                    Text(levelText)
                        .foregroundColor(index + 1 == currentLevel ? .blue : .primary)
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}
