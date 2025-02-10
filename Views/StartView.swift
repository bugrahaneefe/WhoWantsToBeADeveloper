import SwiftUI

private enum Constant {
    static let start = "Start"
}

struct StartView: View {
    let onStart: () -> Void
    
    // Animation states
    @State private var moveRectangles = false    
    @State var text: String = ""
    let finalText: String = " Who wants to \n be a \n developer ?"
    
    var body: some View {
        ZStack {
            // HStack containing two gradient rectangles
            HStack(spacing: .zero) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.mint]),
                            startPoint: .trailing,
                            endPoint: .leading
                        )
                    )
                    .offset(x: moveRectangles ? -UIScreen.main.bounds.width / 2 : 0)
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.mint]),
                            startPoint: .trailing,
                            endPoint: .leading
                        )
                    )
                    .offset(x: moveRectangles ? UIScreen.main.bounds.width / 2 : 0)
            }
            .animation(.easeInOut(duration: 0.8), value: moveRectangles)
            
            VStack {
                // Text appears below button
                Text(text)
                    .font(.system(.title, design: .monospaced))
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .safeAreaPadding(100)
                Spacer()
                // Button remains centered and doesn't move
                Button(Constant.start) {
                    typeWriter()
                }
                .font(.system(.title, design: .monospaced))
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .safeAreaPadding(100)
            }
            .padding(.all)
        }
        .edgesIgnoringSafeArea(.all) // Ensure rectangles extend to screen edges
    }    
}

extension StartView {
    private func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                text.append(finalText[position])
                typeWriter(at: position + 1)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    moveRectangles = true
                }
                onStart()
            }
        }
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
