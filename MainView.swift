import SwiftUI

private enum Constant {
    // MARK: - All Questions
    static let allQuestions: [Question] = [
        // Level 1 - Rookie Developer
        Question(text: "What is SwiftUI?", 
                 options: ["A UI Framework", "A fruit brand", "A game engine"], 
                 correctAnswer: "A UI Framework", 
                 level: 1, 
                 image: nil),
        
        Question(text: "Which language is primarily used for iOS development?", 
                 options: ["Swift", "Java", "Python"], 
                 correctAnswer: "Swift", 
                 level: 1, 
                 image: nil),
        
        Question(text: "What does Xcode do?", 
                 options: ["Text Editing", "Game Development", "iOS App Development"], 
                 correctAnswer: "iOS App Development", 
                 level: 1, 
                 image: nil),
        Question(text: "Which keyword should replace ___ to correctly declare a computed property in Swift?", 
                 options: ["let", "var", "func", "computed"], 
                 correctAnswer: "var", 
                 level: 1, 
                 image: Image("qImage_1")),
        // Level 2 - Intern Developer
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
        
        Question(text: "Which file format is used for iOS Storyboards?", 
                 options: [".xml", ".storyboard", ".swift"], 
                 correctAnswer: ".storyboard", 
                 level: 2, 
                 image: nil),
        
        // Level 3 - Junior Developer
        Question(text: "What does MVC stand for?", 
                 options: ["Model View Controller", "Module View Code", "Main View Class"], 
                 correctAnswer: "Model View Controller", 
                 level: 3, 
                 image: nil),
        
        Question(text: "Which keyword is used to declare a constant in Swift?", 
                 options: ["let", "var", "const"], 
                 correctAnswer: "let", 
                 level: 3, 
                 image: nil),
        
        Question(text: "Which Swift framework is used for UI development?", 
                 options: ["UIKit", "Foundation", "CoreData"], 
                 correctAnswer: "UIKit", 
                 level: 3, 
                 image: nil),
        
        // Level 4 - Mid-Level Developer
        Question(text: "Which of the following is NOT a Swift data type?", 
                 options: ["Int", "Double", "Decimal"], 
                 correctAnswer: "Decimal", 
                 level: 4, 
                 image: nil),
        
        Question(text: "What does 'guard' do in Swift?", 
                 options: ["Unwraps optionals safely", "Creates loops", "Declares variables"], 
                 correctAnswer: "Unwraps optionals safely", 
                 level: 4, 
                 image: nil),
        
        Question(text: "Which of these is a SwiftUI layout container?", 
                 options: ["StackView", "HStack", "AutoLayout"], 
                 correctAnswer: "HStack", 
                 level: 4, 
                 image: nil),
        
        // Level 5 - Senior Developer
        Question(text: "Which database is commonly used in iOS apps?", 
                 options: ["PostgreSQL", "SQLite", "MongoDB"], 
                 correctAnswer: "SQLite", 
                 level: 5, 
                 image: nil),
        
        Question(text: "Which keyword is used for error handling in Swift?", 
                 options: ["try", "catch", "throw"], 
                 correctAnswer: "try", 
                 level: 5, 
                 image: nil),
        
        Question(text: "What does Codable do in Swift?", 
                 options: ["Encodes & Decodes JSON", "Handles UI Animations", "Manages Databases"], 
                 correctAnswer: "Encodes & Decodes JSON", 
                 level: 5, 
                 image: nil),
        
        // Level 6 - Tech Lead
        Question(text: "What is Combine used for in Swift?", 
                 options: ["Data binding & reactive programming", "UI animations", "Game development"], 
                 correctAnswer: "Data binding & reactive programming", 
                 level: 6, 
                 image: nil),
        
        Question(text: "Which protocol is used for networking in Swift?", 
                 options: ["URLSession", "Socket", "HTTPHandler"], 
                 correctAnswer: "URLSession", 
                 level: 6, 
                 image: nil),
        
        Question(text: "What is a Swift 'actor' used for?", 
                 options: ["Managing async concurrency", "Drawing UI", "Logging errors"], 
                 correctAnswer: "Managing async concurrency", 
                 level: 6, 
                 image: nil),
        
        // Level 7 - Apple Developer
        Question(text: "What is App Transport Security (ATS) in iOS?", 
                 options: ["Enforces secure connections", "Manages Bluetooth devices", "Optimizes battery usage"], 
                 correctAnswer: "Enforces secure connections", 
                 level: 7, 
                 image: nil),
        
        Question(text: "Which design pattern is SwiftUI based on?", 
                 options: ["MVVM", "MVC", "VIPER"], 
                 correctAnswer: "MVVM", 
                 level: 7, 
                 image: nil),
        
        Question(text: "What is a Swift Package Manager (SPM) used for?", 
                 options: ["Managing dependencies", "Creating UI elements", "Logging errors"], 
                 correctAnswer: "Managing dependencies", 
                 level: 7, 
                 image: nil)
    ]
    
    static let gameOver = "Game over !"
    static let restart = "Restart"
    static let congrats = "Congratulations! \n You are eligible to be Apple Developer."
    static let toStartMenu = "Go to Start Menu"
}

struct MainView: View {
    // MARK: - State
    @State private var showStartScreen = true
    @State private var showLevelChart = true
    
    @State private var currentLevel = 1
    @State private var currentQuestion: Question? = nil
    
    // Once user picks an answer:
    @State private var userSelection: String? = nil
    @State private var correctAnswerRevealed = false
    
    // For 2-second countdown after user selection
    @State private var countdown = 2
    
    // Game Over / Final
    @State private var showGameOver = false
    @State private var showCongrats = false
    
    var body: some View {
        ZStack {
            if showStartScreen {
                // START SCREEN
                StartView(
                    onStart: {
                        startGame()
                    })
            }
            else if showGameOver {
                // GAME OVER SCREEN
                NotifyView(
                    title: Constant.gameOver,
                    buttonTitle: Constant.restart) { 
                        restartGame()
                    }
            }
            else if showCongrats {
                // CONGRATS SCREEN
                NotifyView(
                    title: Constant.congrats,
                    buttonTitle: Constant.toStartMenu) { 
                        restartGame()
                    }
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
                            .monospaced()
                            .padding()
                    }
                    
                    ZStack {
                        if showLevelChart {
                            LevelView(currentLevel: currentLevel)
                                .safeAreaPadding(40)
                        } else if let question = currentQuestion {
                            QuestionView(question: question,
                                         userSelection: userSelection,
                                         correctAnswerRevealed: correctAnswerRevealed,
                                         onOptionSelected: { selected in
                                userSelection = selected
                                startCountdown()
                            })
                        }
                    }
                    Spacer()
                }
            }
        }
        .animation(.default, value: showStartScreen)
        .onAppear {
            // Nothing special on appear. 
        }
    }
}

// MARK: - Helpers
extension MainView {
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
        let questionsForLevel = Constant.allQuestions.filter { $0.level == level }
        if let randomQ = questionsForLevel.randomElement() {
            currentQuestion = randomQ
        }
        userSelection = nil
        correctAnswerRevealed = false
        
        showLevelChart = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showLevelChart = false
        }
    }
    
    private func startCountdown() {
        // We start a 3-second countdown. 
        countdown = 3
        
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
