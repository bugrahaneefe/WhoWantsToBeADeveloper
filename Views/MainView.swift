import SwiftUI

struct MainView: View {
    @StateObject private var gameManager = GameManager()
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
                            .opacity(0.9)
            
            if gameManager.showStartScreen {
                
                StartView(onStart: { gameManager.startGame() })
            } else if gameManager.showGameOver {
                
                NotifyView(title: Constant.gameOver, buttonTitle: Constant.restart) {
                    gameManager.restartGame()
                }
            } else if gameManager.showCongrats {
                
                NotifyView(title: Constant.congrats, buttonTitle: Constant.toStartMenu) {
                    gameManager.restartGame()
                }
            } else {
                
                VStack {
                    
                    HStack {
                        
                        Text("Level \(gameManager.currentLevel)")
                            .font(.title)
                            .foregroundStyle(Color.orange)
                            .monospaced()
                            .bold()
                            .padding()
                        
                        Spacer()
                        
                        if gameManager.currentQuestion?.timeLimit != nil &&
                            !gameManager.showLevelChart {
                            
                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(.white)
                                Text("\(gameManager.currentCountdown)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .monospaced()
                            }
                            .padding()
                            .frame(height: 5, alignment: .leading)
                        }
                        
                        Spacer()
                        
                        Button(action: { gameManager.showLevelChart.toggle() }) {
                            Image(systemName: "chart.bar.doc.horizontal")                      .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.indigo)
                        }
                        .padding()
                    }
                    .padding(.horizontal, 10)
                    
                    ZStack {
                        
                        if gameManager.showLevelChart {
                            
                            LevelView(currentLevel: gameManager.currentLevel)
                                .safeAreaPadding(40)
                        } else if let question = gameManager.currentQuestion {
                            
                            QuestionView(
                                question: question,
                                visibleOptions: gameManager.visibleOptions,
                                userSelection: gameManager.userSelection,
                                correctAnswerRevealed: gameManager.correctAnswerRevealed,
                                onOptionSelected: gameManager.userSelectOption,
                                onFiftyFifty: { gameManager.useFiftyFifty(for: question) },
                                onAskAI: { gameManager.askAI(for: question) },
                                onX2: gameManager.useX2,
                                jokers: $gameManager.jokers,
                                lockedWrongX2Option: $gameManager.lockedWrongX2Option
                            )
                            if gameManager.showAISuggestion {
                                
                                AskAIView(aiDistribution: $gameManager.aiDistribution) {
                                    gameManager.showAISuggestion = false
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .animation(.default, value: gameManager.showStartScreen)
    }
}
