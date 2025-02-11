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
    
    @State private var userSelection: String? = nil
    @State private var correctAnswerRevealed = false
    
    @State private var countdown = 2
    
    @State private var showGameOver = false
    @State private var showCongrats = false
    
    // -- Jokers & second-chance tracking
    @State private var jokers = JokerManager()
    @State private var showAISuggestion = false
    @State private var aiDistribution: [String: Int] = [:]
    
    // 50-50: keep track of which options are still visible
    @State private var visibleOptions: [String] = []
    
    // x2: track how many guesses made in current question
    @State private var guessesThisQuestion: Int = 0
    
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
                            QuestionView(
                                question: question,
                                visibleOptions: visibleOptions,
                                userSelection: userSelection,
                                correctAnswerRevealed: correctAnswerRevealed,
                                jokers: $jokers,
                                onOptionSelected: { selected in
                                    userSelectOption(selected)
                                },
                                onFiftyFifty: {
                                    useFiftyFifty(for: question)
                                },
                                onAskAI: {
                                    askAI(for: question)
                                },
                                onX2: {
                                    useX2()
                                }
                            )
                        }
                    }
                    Spacer()
                }
                // The simple AI suggestion pop-up
                .sheet(isPresented: $showAISuggestion) {
                    AISuggestionView(
                        aiDistribution: $aiDistribution, 
                        dismissAction: { showAISuggestion = false }
                    )
                }
            }
        }
        .animation(.default, value: showStartScreen)
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
        jokers = JokerManager() // reset jokers
        loadQuestion(for: currentLevel)
    }
    
    private func loadQuestion(for level: Int) {
        let questionsForLevel = Constant.allQuestions.filter { $0.level == level }
        if let randomQ = questionsForLevel.randomElement() {
            currentQuestion = randomQ
        }
        
        userSelection = nil
        correctAnswerRevealed = false
        guessesThisQuestion = 0
        
        // All options visible by default
        if let question = currentQuestion {
            visibleOptions = question.options
        }
        
        // Show the level chart for 2 seconds on each new question
        showLevelChart = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showLevelChart = false
        }
    }
    
    /// Called when user taps an option in the QuestionView.
    private func userSelectOption(_ selected: String) {
        // If there's no selection yet or x2 is active
        guard userSelection == nil || jokers.usedX2 else { return }
        userSelection = selected
        startCountdown()
    }
    
    private func startCountdown() {
        countdown = 2
        guessesThisQuestion += 1
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            countdown -= 1
            
            if countdown <= 0 {
                timer.invalidate()
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
            // Correct
            // If user is on level 7, show final congrats
            if currentLevel == 7 {
                showCongrats = true
            } else {
                currentLevel += 1
                // If user just answered 4th question, unlock x2
                if currentLevel == 5 {
                    jokers.x2Unlocked = true
                }
                loadQuestion(for: currentLevel)
            }
        } else {
            // Wrong
            // If x2 was used and this is the first guess, give second guess
            if jokers.usedX2 && guessesThisQuestion == 1 {
                // Reset just the "selection" to allow second try
                correctAnswerRevealed = false
                self.userSelection = nil
            } else {
                // Game over
                showGameOver = true
            }
        }
    }
    
    private func restartGame() {
        withAnimation {
            showStartScreen = true
            showGameOver = false
            showCongrats = false
        }
    }
    
    // MARK: - Jokers
    
    /// 50-50: remove two random incorrect answers from visibleOptions.
    private func useFiftyFifty(for question: Question) {
        guard !jokers.usedFiftyFifty else { return }
        jokers.usedFiftyFifty = true
        
        let correct = question.correctAnswer
        let incorrectOptions = visibleOptions.filter { $0 != correct }
        
        // If at least 2 incorrect, remove them
        if incorrectOptions.count >= 2 {
            let toRemove = incorrectOptions.shuffled().prefix(2)
            visibleOptions.removeAll(where: { toRemove.contains($0) })
        }
    }
    
    /// Ask AI: show a pop-up that displays random distribution.
    private func askAI(for question: Question) {
        guard !jokers.usedAskAI else { return }
        jokers.usedAskAI = true
        
        aiDistribution = makeRandomDistribution(for: question)
        
        print("aiDistribution before presenting:", aiDistribution) // ✅ Debugging line
        
        if !aiDistribution.isEmpty {
            DispatchQueue.main.async {
                showAISuggestion = true
            }
        } else {
            print("❌ AI Distribution is empty, not showing sheet")
        }
    }

    
    /// Create random distribution with a tilt toward correct answer.
    /// The higher the level, the smaller the advantage for the correct answer.
    private func makeRandomDistribution(for question: Question) -> [String: Int] {
        let correct = question.correctAnswer
        var distribution: [String: Int] = [:]
        
        // Make correct have a random portion in some range,
        // others split the remainder.
        // Higher levels => narrower difference (makes it "harder").
        
        let baseCorrectMin = max(20 - question.level * 2, 10)
        let baseCorrectMax = min(60 - question.level * 3, 50)
        
        let correctPercentage = Int.random(in: baseCorrectMin...baseCorrectMax)
        let othersPercentage = 100 - correctPercentage
        let otherOptions = question.options.filter { $0 != correct }
        
        // Randomly distribute "othersPercentage" among otherOptions
        var sumOfOthers = 0
        for i in 0..<otherOptions.count {
            let isLast = (i == otherOptions.count - 1)
            if !isLast {
                let portion = Int.random(in: 0...othersPercentage - sumOfOthers)
                distribution[otherOptions[i]] = portion
                sumOfOthers += portion
            } else {
                distribution[otherOptions[i]] = othersPercentage - sumOfOthers
            }
        }
        
        distribution[correct] = correctPercentage
        return distribution
    }
    
    /// x2: allows a second chance if first guess is wrong.
    private func useX2() {
        guard jokers.x2Unlocked && !jokers.usedX2 else { return }
        jokers.usedX2 = true
    }
}


struct AISuggestionView: View {
    @Binding var aiDistribution: [String: Int]
    let dismissAction: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                if aiDistribution.isEmpty {
                    Text("AI could not predict an answer.")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                    
                    // Debugging print
                    Text("Debug: \(aiDistribution.description)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(aiDistribution.keys.sorted(), id: \.self) { key in
                            HStack {
                                Text(key)
                                    .font(.headline)
                                Spacer()
                                Text("\(aiDistribution[key] ?? 0)%")
                                    .bold()
                                    .foregroundColor(key == getMostLikelyAnswer() ? .green : .primary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("AI Suggestion")
            .toolbar {
                Button("Done") {
                    dismissAction()
                }
            }
            .onAppear {
                print("🔵 AISuggestionView appeared with data:", aiDistribution) // ✅ Debugging line
            }
        }
    }
    
    private func getMostLikelyAnswer() -> String {
        aiDistribution.max { $0.value < $1.value }?.key ?? ""
    }
}
