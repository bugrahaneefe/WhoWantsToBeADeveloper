import SwiftUI

struct NotifyView: View {
    let title: String
    let buttonTitle: String
    
    // A closure to call when the button is pressed.
    let action: () -> Void
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.indigo)
                .frame(width: 300, height: 200)
                .overlay(
                    VStack(spacing: 20) {
                        Text(title)
                            .font(.title3)
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .lineLimit(nil)
                            .minimumScaleFactor(0.5)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity)
                        
                        Button(action: action) {
                            Text(buttonTitle)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .foregroundColor(.indigo)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 30)
                    }
                        .padding()
                )
        }
        .transition(.opacity)
    }
}
