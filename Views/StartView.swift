import SwiftUI

struct StartView: View {
    let onStart: () -> Void
    let finalText: String = "Who wants to \nbe a \ndeveloper ?"

    // Animation states
    @State private var moveRectangles = false    
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            
            HStack(spacing: .zero) {
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.indigo]),
                            startPoint: .trailing,
                            endPoint: .leading
                        )
                    )
                    .offset(x: moveRectangles ? -UIScreen.main.bounds.width / 2 : 0)
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.indigo]),
                            startPoint: .trailing,
                            endPoint: .leading
                        )
                    )
                    .offset(x: moveRectangles ? UIScreen.main.bounds.width / 2 : 0)
            }
            .animation(.easeInOut(duration: 0.8), value: moveRectangles)
            
            VStack {
                
                Text(text)
                    .font(.system(size: 32, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .minimumScaleFactor(0.5)
                    .lineLimit(nil)
                    .padding(.horizontal, 20)
                    .padding(.top, 100)
                
                Spacer()

                Button(Constant.start) {
                    typeWriter()
                }
                .font(.system(size: 32, weight: .bold, design: .monospaced))
                .foregroundStyle(Color.indigo)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 80)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 10)
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                .minimumScaleFactor(0.7)
                .lineLimit(1)
            }
            .padding(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }    
}

extension StartView {
    private func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
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
