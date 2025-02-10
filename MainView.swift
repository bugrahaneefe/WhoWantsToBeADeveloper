import SwiftUI

struct MainView: View {
    // MARK: - State
    @State private var showStartScreen = true
    @State private var showLevelChart = false
    
    @State private var currentLevel = 1
    @State private var currentQuestion: Question? = nil
    
    // Once user picks an answer:
    @State private var userSelection: String? = nil
    @State private var correctAnswerRevealed = false
    
    // For 3-second countdown after user selection
    @State private var countdown = 3
    @State private var showCountdown = false
    
    // Game Over / Final
    @State private var showGameOver = false
    @State private var showCongrats = false
    
    // MARK: - All Questions
    // For demonstration, each level only has 2 questions. You can expand to 5+ each.
    private var allQuestions: [Question] = [
        // Level 1
        Question(text: "What is SwiftUI?", 
                 options: ["A UI Framework", "A fruit brand", "A game engine"], 
                 correctAnswer: "A UI Framework", 
                 level: 1, 
                 image: nil),
        Question(text: "Which is Apple language?", 
                 options: ["Swift", "Kotlin", "Java"], 
                 correctAnswer: "Swift", 
                 level: 1, 
                 image: nil),
        
        // Level 2
        Question(text: "Which platform uses Xcode?", 
                 options: ["Android", "iOS", "Windows"], 
                 correctAnswer: "iOS", 
                 level: 2, 
                 image: nil),
        Question(text: "Swift is:", 
                 options: ["Compiled", "Interpreted", "Both"], 
                 correctAnswer: "Compiled", 
                 level: 2, 
                 image: nil),
        
        // ... etc. up to level 7
        Question(text: "This is a sample question for level 7", 
                 options: ["Option1", "Option2", "Option3"], 
                 correctAnswer: "Option1", 
                 level: 7, 
                 image: nil),
        Question(text: "Another sample for level 7", 
                 options: ["Yes", "No", "Maybe"], 
                 correctAnswer: "Yes", 
                 level: 7, 
                 image: nil)
    ]
    
    var body: some View {
        ZStack {
            if showStartScreen {
                // START SCREEN
                VStack {
                    Text("Who Wants To Be A Developer?")
                        .font(.largeTitle)
                    Spacer()
                    Button("Start") {
                        startGame()
                    }
                    .font(.title)
                    .padding()
                    Spacer()
                }
                .transition(.opacity)
            }
            else if showGameOver {
                // GAME OVER SCREEN
                VStack {
                    Text("Game Over!")
                        .font(.largeTitle)
                        .padding()
                    Button("Restart") {
                        restartGame()
                    }
                    .font(.title)
                }
                .transition(.opacity)
            }
            else if showCongrats {
                // CONGRATS SCREEN
                VStack {
                    Text("Congrats! You’re Apple Developer!")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                    Button("Go to Start Menu") {
                        // Return to start
                        restartGame()
                    }
                    .font(.title)
                }
                .transition(.opacity)
            }
            else {
                // QUESTION + TOP BAR
                VStack {
                    // TOP BAR with Level chart button
                    HStack {
                        Button(action: {
                            showLevelChart.toggle()
                        }, label: {
                            Image(systemName: "chart.bar") // example icon
                        })
                        .padding()
                        
                        Spacer()
                        
                        Text("Level \(currentLevel)")
                            .font(.headline)
                            .padding()
                    }
                    
                    // If we have a question, show it
                    if let question = currentQuestion {
                        // Show a quick “Level chart” for 2 seconds
                        // or automatically if you want after each question
                        
                        QuestionView(question: question,
                                     userSelection: userSelection,
                                     correctAnswerRevealed: correctAnswerRevealed,
                                     onOptionSelected: { selected in
                            userSelection = selected
                            startCountdown()
                        })
                        
                        if showCountdown {
                            Text("Revealing answer in \(countdown) ...")
                                .font(.headline)
                                .padding()
                        }
                    }
                    
                    Spacer()
                }
                // We can show the LevelView as a sheet or overlay
                .sheet(isPresented: $showLevelChart, content: {
                    LevelView(currentLevel: currentLevel)
                })
            }
        }
        .animation(.default, value: showStartScreen)
        .onAppear {
            // Nothing special on appear. 
        }
    }
    
    // MARK: - Helpers
    
    private func startGame() {
        withAnimation {
            showStartScreen = false
            showGameOver = false
            showCongrats = false
        }
        currentLevel = 1
        loadQuestion(for: currentLevel)
    }
    
    private func loadQuestion(for level: Int) {
        let questionsForLevel = allQuestions.filter { $0.level == level }
        if let randomQ = questionsForLevel.randomElement() {
            currentQuestion = randomQ
        }
        userSelection = nil
        correctAnswerRevealed = false
        showCountdown = false
    }
    
    private func startCountdown() {
        // We start a 3-second countdown. 
        countdown = 3
        showCountdown = true
        
        // A simple timer approach
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            countdown -= 1
            
            if countdown <= 0 {
                timer.invalidate()
                // Reveal correct answer
                correctAnswerRevealed = true
                // Wait 1 second, then check correctness
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    checkAnswer()
                }
            }
        }
    }
    
    private func checkAnswer() {
        guard let question = currentQuestion,
              let userSelection = userSelection else { return }
        
        if userSelection == question.correctAnswer {
            // CORRECT
            // if this was level 7, show congrats
            if currentLevel == 7 {
                showCongrats = true
            } else {
                // Move to next level
                currentLevel += 1
                loadQuestion(for: currentLevel)
            }
        } else {
            // WRONG -> Game Over
            showGameOver = true
        }
    }
    
    private func restartGame() {
        withAnimation {
            showStartScreen = true
            showGameOver = false
            showCongrats = false
        }
    }
}
