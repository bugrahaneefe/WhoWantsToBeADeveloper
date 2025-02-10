import SwiftUI

struct NotifyView: View {
    let title: String
    let buttonTitle: String
    // A closure to call when the button is pressed.
    // This will be provided by MainView.
    let action: () -> Void
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            Button(buttonTitle) {
                action()
            }
            .font(.title)
        }
        .transition(.opacity)
    }
}
