import SwiftUI

struct JokerManager {
    var usedFiftyFifty: Bool = false
    var usedAskAI: Bool = false
    var usedX2: Bool = false
    
    /// Whether x2 Joker is unlocked (after 4th question).
    var x2Unlocked: Bool = false
}

struct QuestionView: View {
    let question: Question
    let visibleOptions: [String]
    
    let userSelection: String?
    let correctAnswerRevealed: Bool
    
    @Binding var jokers: JokerManager
    
    /// User picks an option
    let onOptionSelected: (String) -> Void
    
    /// Jokers
    let onFiftyFifty: () -> Void
    let onAskAI: () -> Void
    let onX2: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.black]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor(), lineWidth: 4)
                    .overlay(
                        VStack(spacing: 20) {
                            // -- JOKER HStack
                            HStack(spacing: 15) {
                                // 50-50
                                JokerIcon(
                                    label: "50%",
                                    isUsed: jokers.usedFiftyFifty,
                                    action: onFiftyFifty
                                )
                                // Ask AI
                                JokerIcon(
                                    label: "AI",
                                    isUsed: jokers.usedAskAI,
                                    action: onAskAI
                                )
                                // x2
                                JokerIcon(
                                    label: "x2",
                                    isUsed: jokers.usedX2 || !jokers.x2Unlocked,
                                    action: onX2
                                )
                            }
                            
                            // Show image if available
                            if let image = question.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 250)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.mint, lineWidth: 2)
                                    )
                            }
                            
                            Text(question.text)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .monospaced()
                            
                            // Visible options after 50-50
                            ForEach(visibleOptions, id: \.self) { option in
                                Button(action: {
                                    if userSelection == nil || jokers.usedX2 {
                                        onOptionSelected(option)
                                    }
                                }, label: {
                                    Text(option)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .monospaced()
                                })
                                .foregroundColor(.white)
                                .background(backgroundColor(for: option))
                                .cornerRadius(8)
                            }
                        }
                            .padding()
                    )
            )
            .safeAreaPadding(20)
    }
    
    private func backgroundColor(for option: String) -> Color {
        // If user has chosen something (or is on second guess with x2) but answer not revealed yet
        if let userSelection = userSelection, option == userSelection, !correctAnswerRevealed {
            return Color.orange
        }
        // If correctAnswerRevealed -> highlight correct in green; if user was wrong, highlight in red
        if correctAnswerRevealed {
            if option == question.correctAnswer {
                return Color.green
            } else if option == userSelection {
                return Color.red
            }
        }
        return Color.mint
    }
    
    private func borderColor() -> Color {
        if let userSelection = userSelection {
            if !correctAnswerRevealed {
                return Color.orange
            } else {
                return (userSelection == question.correctAnswer) ? Color.green : Color.red
            }
        }
        return Color.mint
    }
}

/// A small helper view for each Joker icon.
/// When `isUsed == true`, we disable it and make it gray.
struct JokerIcon: View {
    let label: String
    let isUsed: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            if !isUsed {
                action()
            }
        } label: {
            Text(label)
                .padding(6)
                .foregroundColor(.white)
                .background(isUsed ? Color.gray : Color.blue)
                .cornerRadius(8)
        }
        .disabled(isUsed)
    }
}
