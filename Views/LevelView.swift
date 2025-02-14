import SwiftUI

struct LevelView: View {    
    var currentLevel: Int
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ForEach(Constant.levels.indices.reversed(), id: \.self) { index in
                
                Text(Constant.levels[index])
                    .foregroundColor(index + 1 == currentLevel ? Color.indigo : Color.white)
                    .font(.headline)
                    .padding(5)
                    .monospaced()
            }
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 15)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.orange]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .overlay(
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
        )
    }
}
