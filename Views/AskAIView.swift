import SwiftUI

struct AskAIView: View {
    @Binding var aiDistribution: [String: Int]
    let dismissAction: () -> Void
    
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
                        .stroke(Color.white, lineWidth: 4)
                        .overlay(
                            
                            VStack {
                                
                                VStack {
                                    
                                    Text(Constant.aiTitle)
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .minimumScaleFactor(0.3)
                                        .frame(maxWidth: .infinity)
                                        .padding(.top, 20)
                                    
                                    ForEach(aiDistribution.keys.sorted(), id: \.self) { key in
                                        
                                        HStack {
                                            
                                            Text(key)
                                                .font(.headline)
                                                .frame(maxWidth: .infinity)
                                                .lineLimit(4)
                                                .minimumScaleFactor(0.5)
                                                .monospaced()
                                                .foregroundColor(Color.indigo)
                                            
                                            Spacer()
                                            
                                            Text("\(aiDistribution[key] ?? 0)%")
                                                .font(.subheadline)
                                                .frame(maxWidth: .infinity)
                                                .lineLimit(2)
                                                .minimumScaleFactor(0.5)
                                                .monospaced()
                                                .bold()
                                                .foregroundColor(key == getMostLikelyAnswer() ? Color.green : Color.red)
                                        }
                                        .padding()
                                        .background(Color.white.opacity(0.9))
                                        .cornerRadius(8)
                                    }
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    dismissAction()
                                }) {
                                    
                                    Text(Constant.done)
                                        .font(.headline)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.white)
                                        .foregroundColor(Color.indigo)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 40)
                                }
                                .padding(.bottom, 20)
                            }
                                .padding(.horizontal, 50)
                        )
                )
                .safeAreaPadding(20)
                .padding(.horizontal, 10)
        }
    }
}

extension AskAIView {
    
    private func getMostLikelyAnswer() -> String {
        aiDistribution.max { $0.value < $1.value }?.key ?? ""
    }
}
