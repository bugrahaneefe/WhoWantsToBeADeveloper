import SwiftUI

public enum Constant {
    // MARK: - All Questions
    static let allQuestions: [Question] = [
        // Level 1 - Rookie Developer
//        Question(text: "What is SwiftUI?", 
//                 options: ["A UI Framework", "A fruit brand", "A game engine", "UIKit"], 
//                 correctAnswer: "A UI Framework", 
//                 level: 1, 
//                 image: nil),
//        Question(text: "Which language is primarily used for iOS development?", 
//                 options: ["Swift", "Java", "Python", "Kotlin"], 
//                 correctAnswer: "Swift", 
//                 level: 1, 
//                 image: nil),
//        Question(text: "What does Xcode do?", 
//                 options: ["Text Editing", "Game Development", "iOS App Development", "Video Editing"], 
//                 correctAnswer: "iOS App Development", 
//                 level: 1, 
//                 image: nil),
        Question(text: "Which keyword should replace ___ to correctly declare a computed property in Swift?", 
                 options: ["let", "var", "func", "computed"], 
                 correctAnswer: "var", 
                 level: 1, 
                 image: Image("qImage_1")),
        // Level 2 - Intern Developer
        Question(text: "Which platform uses Xcode?", 
                 options: ["Android", "Linux", "Windows", "Apple Platforms"], 
                 correctAnswer: "Apple Platforms", 
                 level: 2, 
                 image: nil),
        
        Question(text: "Swift is:", 
                 options: ["Compiled", "Interpreted", "Both"], 
                 correctAnswer: "Compiled", 
                 level: 2, 
                 image: nil),
        
        Question(text: "Which file format is used for iOS Storyboards?", 
                 options: [".xml", ".storyboard", ".swift", ".json"], 
                 correctAnswer: ".storyboard", 
                 level: 2, 
                 image: nil),
        
        // Level 3 - Junior Developer
        Question(text: "What does MVC stand for?", 
                 options: ["Model View Controller", "Module View Code", "Main View Class", "Model View ViewModel"], 
                 correctAnswer: "Model View Controller", 
                 level: 3, 
                 image: nil),
        
        Question(text: "Which keyword is used to declare a constant in Swift?", 
                 options: ["let", "var", "const", "final"], 
                 correctAnswer: "let", 
                 level: 3, 
                 image: nil),
        
        Question(text: "Which Swift framework is used for UI development?", 
                 options: ["UIKit", "Foundation", "CoreData", "SQLite"], 
                 correctAnswer: "UIKit", 
                 level: 3, 
                 image: nil),
        
        // Level 4 - Mid-Level Developer
        Question(text: "Which of the following is NOT a Swift data type?", 
                 options: ["Int", "Double", "Decimal", "Float"], 
                 correctAnswer: "Decimal", 
                 level: 4, 
                 image: nil),
        
        Question(text: "What does 'guard' do in Swift?", 
                 options: ["Unwraps optionals safely", "Creates loops", "Declares variables", "Creates loops"], 
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
    
    static let gameOver = "Try next time !"
    static let restart = "Restart"
    static let start = "Start"
    static let congrats = "Congratulations! \n You are eligible to be Apple Developer."
    static let toStartMenu = "Go to Start Menu"
}

class GameManager: ObservableObject {
    // MARK: - Game States
    @Published var showStartScreen = true
    @Published var showLevelChart = true
    @Published var currentLevel = 1
    @Published var currentQuestion: Question? = nil
    @Published var userSelection: String? = nil
    @Published var correctAnswerRevealed = false
    @Published var countdown = 2
    @Published var showGameOver = false
    @Published var showCongrats = false
    @Published var jokers = JokerStatus()
    @Published var showAISuggestion = false
    @Published var aiDistribution: [String: Int] = [:]
    @Published var visibleOptions: [String] = []
    @Published var guessesThisQuestion: Int = 0
    @Published var lockedWrongX2Option: String? = nil
    
    // MARK: - Starting game Logic
    func startGame() {
        withAnimation {
            showStartScreen = false
            showGameOver = false
            showCongrats = false
        }
        currentLevel = 1
        // reset jokers.
        jokers = JokerStatus()
        loadQuestion(for: currentLevel)
    }
    
    func loadQuestion(for level: Int) {
        let questionsForLevel = Constant.allQuestions.filter { $0.level == level }
        if let randomQ = questionsForLevel.randomElement() {
            currentQuestion = randomQ
        }
        
        userSelection = nil
        correctAnswerRevealed = false
        guessesThisQuestion = 0
        
        // All options visible by default.
        if let question = currentQuestion {
            visibleOptions = question.options
        }
        
        // Show the level chart for 2 seconds on each new question.
        showLevelChart = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showLevelChart = false
        }
    }
    
    func userSelectOption(_ selected: String) {
        guard userSelection == nil || jokers.usedX2 else { return }
        userSelection = selected
        SoundManager.shared.playSound(named: "answer")
        startCountdown()
    }
    
    private func startCountdown() {
        countdown = 2
        guessesThisQuestion += 1
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.countdown -= 1
            
            if self.countdown <= 0 {
                timer.invalidate()
                self.correctAnswerRevealed = true
                self.checkAnswer()
            }
        }
    }
    
    private func checkAnswer() {
        guard let question = currentQuestion,
              let userSelection = userSelection else { return }
        
        if userSelection == question.correctAnswer {
            if currentLevel == 7 {
                SoundManager.shared.playSound(named: "win")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showCongrats = true
                }
            } else {
                SoundManager.shared.playSound(named: "win")
                currentLevel += 1
                if currentLevel == 5 {
                    jokers.x2Unlocked = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.loadQuestion(for: self.currentLevel)
                }
            }
        } else {
            SoundManager.shared.playSound(named: "lose")
            if jokers.usedX2 && guessesThisQuestion == 1 {
                lockedWrongX2Option = userSelection
                correctAnswerRevealed = false
                self.userSelection = nil
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showGameOver = true
                }
            }
        }
    }
    
    func restartGame() {
        withAnimation {
            showStartScreen = true
            showGameOver = false
            showCongrats = false
        }
    }
    
    // MARK: - Logic of jokers
    
    // 50-50.
    func useFiftyFifty(for question: Question) {
        guard !jokers.usedFiftyFifty else { return }
        jokers.usedFiftyFifty = true
        
        let correct = question.correctAnswer
        let incorrectOptions = visibleOptions.filter { $0 != correct }
        
        if incorrectOptions.count >= 2 {
            let toRemove = incorrectOptions.shuffled().prefix(2)
            visibleOptions.removeAll(where: { toRemove.contains($0) })
        }
    }
    
    // askAI.
    func askAI(for question: Question) {
        guard !jokers.usedAskAI else { return }
        jokers.usedAskAI = true
        
        aiDistribution = makeRandomDistribution(for: question)
        self.showAISuggestion = true
    }
    
    private func makeRandomDistribution(for question: Question) -> [String: Int] {
        let correct = question.correctAnswer
        var distribution: [String: Int] = [:]
        
        // percentage range of correct answer
        let baseCorrectMin = max(40 - question.level * 3, 20)
        // domination of correct answer in percentages
        let baseCorrectMax = min(80 - question.level * 5, 65)
        
        let correctPercentage = Int.random(in: baseCorrectMin...baseCorrectMax)
        let othersPercentage = 100 - correctPercentage
        let otherOptions = question.options.filter { $0 != correct }
        
        var sumOfOthers = 0
        for i in 0..<otherOptions.count {
            let isLast = (i == otherOptions.count - 1)
            if !isLast {
                let portion = Int.random(in: 5...(othersPercentage - sumOfOthers - (5 * (otherOptions.count - i - 1))))
                distribution[otherOptions[i]] = portion
                sumOfOthers += portion
            } else {
                distribution[otherOptions[i]] = othersPercentage - sumOfOthers
            }
        }
        
        distribution[correct] = correctPercentage
        return distribution
    }
    
    // x2.
    func useX2() {
        guard jokers.x2Unlocked && !jokers.usedX2 else { return }
        jokers.usedX2 = true
    }
}
