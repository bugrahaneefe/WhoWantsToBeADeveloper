import SwiftUI

struct QuestionView: View {
    let question: Question
    let userSelection: String?
    let correctAnswerRevealed: Bool
    
    // A closure to notify when the user picks an option
    let onOptionSelected: (String) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            if let image = question.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            
            Text(question.text)
                .font(.title2)
                .multilineTextAlignment(.center)
            
            ForEach(question.options, id: \.self) { option in
                Button(action: {
                    // If user hasn't selected yet, call onOptionSelected
                    if userSelection == nil {
                        onOptionSelected(option)
                    }
                }, label: {
                    Text(option)
                        .padding()
                        .frame(maxWidth: .infinity)
                })
                .foregroundColor(.white)
                // Here we decide the background color based on user selection & correctness
                .background(backgroundColor(for: option))
                .cornerRadius(8)
            }
        }
        .padding()
    }
    
    private func backgroundColor(for option: String) -> Color {
        // If we haven't revealed the correct answer yet, default style:
        guard correctAnswerRevealed else {
            return Color.blue
        }
        
        // Once the correct answer is revealed:
        if option == question.correctAnswer {
            return Color.green
        } else if option == userSelection {
            return Color.red
        } else {
            return Color.blue
        }
    }
}
