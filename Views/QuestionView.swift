import SwiftUI

struct QuestionView: View {
    let question: Question
    let userSelection: String?
    let correctAnswerRevealed: Bool
    
    let onOptionSelected: (String) -> Void
    
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
                            HStack(content: {
                                Circle()
                                    .background(Color.blue)
                                Circle()
                                    .background(Color.blue)
                                Circle()
                                    .background(Color.blue)
                                Circle()
                                    .background(Color.blue)
                            })
        
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
                            
                            ForEach(question.options, id: \.self) { option in
                                Button(action: {
                                    if userSelection == nil {
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
        if let userSelection = userSelection {
            if option == userSelection && !correctAnswerRevealed {
                return Color.orange
            }
        }
        
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
                return Color.orange // While waiting for reveal
            } else {
                return (userSelection == question.correctAnswer) ? Color.green : Color.red // Final color
            }
        }
        return Color.mint // Default before selection
    }
}
