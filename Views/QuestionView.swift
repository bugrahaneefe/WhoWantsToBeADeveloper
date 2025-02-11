import SwiftUI

struct QuestionView: View {
    let question: Question
    let visibleOptions: [String]
    
    let userSelection: String?
    let correctAnswerRevealed: Bool
    
    /// User picks an option.
    let onOptionSelected: (String) -> Void
    
    /// Jokers.
    let onFiftyFifty: () -> Void
    let onAskAI: () -> Void
    let onX2: () -> Void
    
    @State private var isImageEnlarged = false
    @Binding var jokers: JokerStatus
    @Binding var lockedWrongX2Option: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.indigo, Color.indigo, Color.indigo, Color.indigo]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(borderColor(), lineWidth: 4)
                        .overlay(
                            VStack(spacing: 20) {
                                // JOKERS
                                HStack(spacing: 15) {
                                    // 50-50.
                                    JokerIcon(
                                        label: "50%",
                                        isUsed: jokers.usedFiftyFifty,
                                        action: onFiftyFifty
                                    )
                                    // Ask AI.
                                    JokerIcon(
                                        label: "AI",
                                        isUsed: jokers.usedAskAI,
                                        action: onAskAI
                                    )
                                    if jokers.x2Unlocked {
                                        // x2.
                                        JokerIcon(
                                            label: "x2",
                                            isUsed: jokers.usedX2 || !jokers.x2Unlocked,
                                            action: onX2
                                        )
                                    }
                                }
                                
                                // Show image if question has.
                                if let image = question.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                        .onTapGesture {
                                            withAnimation {
                                                isImageEnlarged.toggle()
                                            }
                                        }
                                }
                                
                                Text(question.text)
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                                    .monospaced()
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.5)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal, 10)
                                
                                // Visible options after 50-50.
                                ForEach(visibleOptions, id: \.self) { option in
                                    Button(action: {
                                        if userSelection == nil || jokers.usedX2 {
                                            if lockedWrongX2Option != option {
                                                onOptionSelected(option)
                                            }
                                        }
                                    }, label: {
                                        ScrollView {
                                            Text(option)
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .lineLimit(nil)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .monospaced()
                                                .foregroundStyle(Color.indigo)
                                        }
                                        .scrollIndicators(.hidden)
                                    })
                                    .foregroundColor(.white)
                                    .background(backgroundColor(for: option))
                                    .cornerRadius(8)
                                    .opacity(lockedWrongX2Option == option ? 0.5 : 1)
                                    .disabled(lockedWrongX2Option == option)
                                    .shadow(radius: 15)
                                }
                            }
                                .padding()
                        )
                )
                .safeAreaPadding(20)
                .padding(.horizontal, 10)
            if isImageEnlarged {
                if let image = question.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .onTapGesture {
                            withAnimation {
                                isImageEnlarged.toggle()
                            }
                        }
                }
            }
        }
    }
    
    private func backgroundColor(for option: String) -> Color {
        // If user selected an answer but answer is not revealed yet.
        if let userSelection = userSelection, option == userSelection, !correctAnswerRevealed {
            return Color.orange
        }
        // If correct answer is revealed, highlight in green. If incorrect answer is revealed, highlight in red.
        if correctAnswerRevealed {
            if option == question.correctAnswer {
                return Color.green
            } else if option == userSelection {
                return Color.red
            }
        }
        return Color.white
    }
    
    private func borderColor() -> Color {
        if let userSelection = userSelection {
            if !correctAnswerRevealed {
                return Color.orange
            } else {
                return (userSelection == question.correctAnswer) ? Color.green : Color.red
            }
        }
        return Color.white
    }
}
