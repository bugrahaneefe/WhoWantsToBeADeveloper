import SwiftUI

struct QuestionView: View {
    let question: Question
    let visibleOptions: [String]
    
    let userSelection: String?
    let correctAnswerRevealed: Bool
    
    // user picks an option.
    let onOptionSelected: (String) -> Void
    
    // jokers.
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
                            
                            // Main content
                            VStack(spacing: 20) {
                                
                                // jokers
                                HStack(spacing: 15) {
                                    
                                    JokerIcon(
                                        label: "50%",
                                        isUsed: jokers.usedFiftyFifty,
                                        action: onFiftyFifty
                                    )
                                    
                                    JokerIcon(
                                        label: "AI",
                                        isUsed: jokers.usedAskAI,
                                        action: onAskAI
                                    )
                                    
                                    if jokers.x2Unlocked {
                                        
                                        JokerIcon(
                                            label: "x2",
                                            isUsed: jokers.usedX2 || !jokers.x2Unlocked,
                                            action: onX2
                                        )
                                    }
                                }
                                
                                // optional image
                                if let image = question.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                        .frame(maxHeight: 150)
                                        .onTapGesture {
                                            withAnimation {
                                                isImageEnlarged.toggle()
                                            }
                                        }
                                }
                                
                                // question text
                                Text(question.text)
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                                    .monospaced()
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.3)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal, 10)
                                
                                // options
                                ForEach(visibleOptions, id: \.self) { option in
                                    
                                    Button {
                                        if userSelection == nil || jokers.usedX2 {
                                            if lockedWrongX2Option != option {
                                                onOptionSelected(option)
                                            }
                                        }
                                    } label: {
                                        
                                        Text(option)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .lineLimit(2)
                                            .minimumScaleFactor(0.3)
                                            .monospaced()
                                            .foregroundStyle(Color.indigo)
                                    }
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
            
            // Enlarged image overlay if image is too small to see
            if isImageEnlarged, let image = question.image {
                
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
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

extension QuestionView {
    
    private func backgroundColor(for option: String) -> Color {
        // if user selected an answer but answer is not revealed yet.
        if let userSelection = userSelection, option == userSelection, !correctAnswerRevealed {
            return Color.orange
        }
        // if correct answer is revealed, highlight in green. If incorrect answer is revealed, highlight in red.
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
