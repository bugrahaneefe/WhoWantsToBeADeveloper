import SwiftUI

public enum Constant {
    // MARK: - All Questions
    static let allQuestions: [Question] = [
        // Level 1 - Rookie Developer
        Question(text: "What is the primary purpose of Swift language?",
                 options: ["To develop desktop applications", "To develop web applications", "To develop iOS applications", "To write assembly-level programs"],
                 correctAnswer: "To develop iOS and macOS applications",
                 level: 1,
                 image: nil,
                 timeLimit: 15),
        Question(text: "Which language is primarily used for iOS development?",
                 options: ["Swift", "Java", "Python", "Kotlin"], 
                 correctAnswer: "Swift", 
                 level: 1, 
                 image: nil,
                 timeLimit: 15),
        Question(text: "What does Xcode do?",
                 options: ["Text Editing", "Game Development", "iOS App Development", "Video Editing"], 
                 correctAnswer: "iOS App Development", 
                 level: 1, 
                 image: nil,
                 timeLimit: 15),
        Question(text: "How do you define a function in Swift?",
                 options: ["func myFunction() {}", "function myFunction {}", "def myFunction():", "void myFunction() {}"],
                 correctAnswer: "func myFunction() {}",
                 level: 1,
                 image: nil,
                 timeLimit: 10),
        Question(text: "Which keyword should replace ___ to correctly declare a computed property in Swift?",
                 options: ["let", "var", "func", "computed"], 
                 correctAnswer: "var", 
                 level: 1, 
                 image: Image("qImage_1"),
                 timeLimit: 10),
        // Level 2 - Intern Developer
        Question(text: "Which of the following is a valid way to declare a constant in Swift?",
                 options: ["first", "second", "third", "fourth"],
                 correctAnswer: "first",
                 level: 2,
                 image: Image("qImage_2"),
                 timeLimit: 20),
        Question(text: "Swift is:",
                 options: ["Compiled", "Interpreted", "Both"], 
                 correctAnswer: "Compiled", 
                 level: 2, 
                 image: nil,
                 timeLimit: 20),
        Question(text: "Which file format is used for iOS Storyboards?",
                 options: [".xml", ".storyboard", ".swift", ".json"], 
                 correctAnswer: ".storyboard", 
                 level: 2, 
                 image: nil,
                 timeLimit: 20),
        Question(text: "What does the 'weak' keyword do in Swift?",
                 options: ["Prevents memory leaks", "Increases performance", "Removes type safety", "Makes a variable mutable"],
                 correctAnswer: "Prevents memory leaks",
                 level: 2,
                 image: nil,
                 timeLimit: 20),
        Question(text: "What does ! mean in Swift?",
                 options: ["It is used to indicate forced unwrapping of an optional", "It is used to declare a constant", "It is used to mark a variable as optional", "It is used for comments"],
                 correctAnswer: "It is used to indicate forced unwrapping of an optional",
                 level: 2,
                 image: nil,
                 timeLimit: 20),
        Question(text: "What is the recommended way to store small amounts of persistent data in iOS?",
                 options: ["UserDefaults", "Core Data", "SQLite", "Realm"],
                 correctAnswer: "UserDefaults",
                 level: 2,
                 image: nil,
                 timeLimit: 20),
        Question(text: "What is a Swift Package Manager (SPM) used for?",
                 options: ["Creating third-party libraries", "Managing dependencies", "Creating UI elements", "Logging errors"],
                 correctAnswer: "Managing dependencies",
                 level: 2,
                 image: nil,
                 timeLimit: 20),
        // Level 3 - Junior Developer
        Question(text: "What does MVC stand for?",
                 options: ["Model View Controller", "Module View Code", "Main View Class", "Model View ViewModel"], 
                 correctAnswer: "Model View Controller", 
                 level: 3, 
                 image: nil,
                 timeLimit: 20),
        Question(text: "Which collection type in Swift does not allow duplicate values?",
                 options: ["Array", "Dictionary", "Set", "Tuple"],
                 correctAnswer: "Set",
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        Question(text: "How do you navigate from one UIViewController to another in UIKit?",
                 options: ["present(_:animated:completion:)", "navigateTo(_:)", "push(_:animated:)", "switchViewController()"],
                 correctAnswer: "present(_:animated:completion:)",
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        Question(text: "What is the time complexity of binary search?",
                 options: ["O(n)", "O(log n)", "O(n log n)", "O(1)"],
                 correctAnswer: "O(log n)",
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        Question(text: "Which keyword is used to declare a constant in Swift?",
                 options: ["let", "var", "const", "final"], 
                 correctAnswer: "let", 
                 level: 3, 
                 image: nil,
                 timeLimit: 20),
        Question(text: "Which Swift framework is used for UI development?", 
                 options: ["UIKit", "Foundation", "CoreData", "SQLite"], 
                 correctAnswer: "UIKit", 
                 level: 3, 
                 image: nil,
                 timeLimit: 20),
        Question(text: "Which design pattern is SwiftUI based on?",
                 options: ["MVVM", "MVC", "VIPER", "Singleton"],
                 correctAnswer: "MVVM",
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        // Level 4 - Mid-Level Developer
        Question(text: "Which of the following is NOT a Swift data type?", 
                 options: ["Int", "Double", "Decimal", "Float"], 
                 correctAnswer: "Decimal", 
                 level: 4, 
                 image: nil,
                 timeLimit: 30),
        Question(text: "What is a delegate in Swift?",
                 options: ["A design pattern for communication between objects",
                           "A keyword used for memory management",
                           "A function that executes asynchronously",
                           "A type of SwiftUI view"],
                 correctAnswer: "A design pattern for communication between objects",
                 level: 4,
                 image: nil,
                 timeLimit: 30),
        Question(text: "What is the role of the protocol in Swift?",
                 options: ["A set of methods and properties that suit a particular task or piece of functionality", "A method to send data over the internet", "A way to define optional properties", "None of the above"],
                 correctAnswer: "A set of methods and properties that suit a particular task or piece of functionality",
                 level: 4,
                 image: nil,
                 timeLimit: 30),
        Question(text: "What does 'guard' do in Swift?",
                 options: ["Unwraps optionals safely", "Creates loops", "Declares variables", "Creates loops"], 
                 correctAnswer: "Unwraps optionals safely", 
                 level: 4, 
                 image: nil,
                 timeLimit: 30),
        Question(text: "Which method is called when a UIViewController transitions from one state to another in UIKit?",
                 options: ["viewDidLoad()",
                           "viewDidAppear(_:)",
                           "viewWillTransition(to:with:)",
                           "traitCollectionDidChange(_:)"],
                 correctAnswer: "viewWillTransition(to:with:)",
                 level: 4,
                 image: nil,
                 timeLimit: 30),
        
        // Level 5 - Senior Developer
        Question(text: "What is the main advantage of using a lock-free data structure?",
                 options: ["Avoids race conditions completely",
                           "Improves performance by reducing thread contention",
                           "Ensures data consistency without the need for synchronization",
                           "Allows mutable access to shared memory"],
                 correctAnswer: "Improves performance by reducing thread contention",
                 level: 5,
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "Which of the following best describes the Copy-On-Write mechanism in Swift?",
                 options: ["Optimize value types by sharing storage until mutation",
                           "Allow reference types to behave like value types",
                           "A Swift concurrency model",
                           "Automatic memory management"],
                 correctAnswer: "Used to optimize value types by sharing storage until mutation",
                 level: 5,
                 image: nil,
                 timeLimit: nil),

        Question(text: "Which keyword is used for error handling in Swift?",
                 options: ["try", "catch", "throw", "debug"],
                 correctAnswer: "try",
                 level: 5, 
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "What does Codable do in Swift?", 
                 options: ["Encodes & Decodes JSON", "Handles UI Animations", "Manages Databases", "Allows mutation during runtime"],
                 correctAnswer: "Encodes & Decodes JSON",
                 level: 5, 
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "Which statements about the following Swift code are true?",
                 options: ["It's not legal to reuse the name s on line 1", "The output will be BAR.", "The value of a is undefined after line 3", "There is a compile error on line 3"],
                 correctAnswer: "The output will be BAR.",
                 level: 5,
                 image: Image("qImage_3"),
                 timeLimit: nil),
        
        // Level 6 - Tech Lead
        Question(text: "What is Combine used for in Swift?", 
                 options: ["Data binding & reactive programming", "UI animations", "Game development"], 
                 correctAnswer: "Data binding & reactive programming", 
                 level: 6, 
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "What happens if you attempt to mutate a property inside an `actor` in Swift from outside?",
                 options: ["The mutation will fail at compile time unless marked as `@MainActor`",
                           "It will execute normally but might cause a race condition",
                           "Swift will automatically lock access to ensure thread safety",
                           "The mutation will be scheduled asynchronously to prevent data races"],
                 correctAnswer: "The mutation will be scheduled asynchronously to prevent data races",
                 level: 6,
                 image: nil,
                 timeLimit: nil),

        Question(text: "Which protocol is used for networking in Swift?",
                 options: ["URLSession", "Socket", "HTTPHandler"], 
                 correctAnswer: "URLSession", 
                 level: 6, 
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "What is a Swift 'actor' used for?", 
                 options: ["Managing async concurrency", "Drawing UI", "Logging errors"], 
                 correctAnswer: "Managing async concurrency", 
                 level: 6, 
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "What is App Transport Security (ATS) in iOS?",
                 options: ["Enforces secure connections", "Manages Bluetooth devices", "Optimizes battery usage", "Prevents race condition during transportations"],
                 correctAnswer: "Enforces secure connections",
                 level: 6,
                 image: nil,
                 timeLimit: nil),
        
        // Level 7 - Apple Developer
        
        Question(text: "What is the best app to learn Swift?",
                 options: ["Who wants to be a developer ?",
                           "Who wants to be a developer ?",
                           "Who wants to be a developer ?",
                           "Who wants to be a developer ?"],
                 correctAnswer: "Who wants to be a developer ?",
                 level: 7,
                 image: Image("applelogo"),
                 timeLimit: nil)
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
    @Published var showGameOver = false
    @Published var showCongrats = false
    @Published var jokers = JokerStatus()
    @Published var showAISuggestion = false
    @Published var aiDistribution: [String: Int] = [:]
    @Published var visibleOptions: [String] = []
    @Published var guessesThisQuestion: Int = 0
    @Published var lockedWrongX2Option: String? = nil
    @Published var currentCountdown: Int = 0
    private var timer: Timer?
    
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
        timer?.invalidate()
        
        let questionsForLevel = Constant.allQuestions.filter { $0.level == level }
        if let randomQ = questionsForLevel.randomElement() {
            currentQuestion = randomQ
        }
        
        userSelection = nil
        correctAnswerRevealed = false
        guessesThisQuestion = 0
                
        // Show the level chart for 2 seconds on each new question.
        showLevelChart = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showLevelChart = false
            
            // All options visible by default.
            if let question = self.currentQuestion {
                self.visibleOptions = question.options
                
                // time limit if question has
                if let timeLimit = question.timeLimit {
                    self.currentCountdown = timeLimit
                    self.startCountdown(count: self.currentCountdown, forSelection: false)
                } else {
                    self.currentCountdown = 0
                }
            }
        }
    }
    
    func userSelectOption(_ selected: String) {
        guard userSelection == nil || jokers.usedX2 else { return }
        userSelection = selected
        SoundManager.shared.playSound(named: "answer")
        timer?.invalidate()
        startCountdown(count: 2)
    }
    
    private func startCountdown(count: Int, forSelection: Bool = true) {
        var countdown = count
        
        if forSelection {
            guessesThisQuestion += 1
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                countdown -= 1
                
                if countdown <= 0 {
                    timer.invalidate()
                    self.correctAnswerRevealed = true
                    self.checkAnswer()
                }
            }
        } else {
            // implement count view here
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                
                if self.currentCountdown > 0 {
                    self.currentCountdown -= 1
                } else {
                    self.timer?.invalidate()
                    self.showGameOver = true
                    SoundManager.shared.playSound(named: "lose")
                }
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

        // 1) Verify the correct answer is still visible
        guard visibleOptions.contains(correct) else {
            print("❌ Correct answer not in visible options, returning empty distribution.")
            return [:]
        }
        
        // 2) Decide a random % for the correct answer
        let baseCorrectMin = max(40 - question.level * 3, 25)
        let baseCorrectMax = min(80 - question.level * 5, 70)
        let correctPercentage = Int.random(in: baseCorrectMin...baseCorrectMax)
        
        // 3) Distribute the remainder among the other visible options
        let othersPercentage = 100 - correctPercentage
        let otherOptions = visibleOptions.filter { $0 != correct }
        
        var sumOfOthers = 0
        for i in 0..<otherOptions.count {
            let isLast = (i == otherOptions.count - 1)
            
            // If we want to ensure no single option gets more than `correctPercentage`,
            // we can limit it to (correctPercentage - 1) or something smaller than `correctPercentage`.
            if !isLast {
                // Ensure each option gets at least 5%, but no more than correctPercentage - 1
                let maxPossible = min(correctPercentage - 1, othersPercentage - sumOfOthers - 5 * (otherOptions.count - i - 1))
                if maxPossible <= 5 {
                    // If we can't give each at least 5 without exceeding, break or set to 5
                    distribution[otherOptions[i]] = 5
                    sumOfOthers += 5
                } else {
                    let portion = Int.random(in: 5...maxPossible)
                    distribution[otherOptions[i]] = portion
                    sumOfOthers += portion
                }
            } else {
                // Last one gets the remainder
                distribution[otherOptions[i]] = othersPercentage - sumOfOthers
                sumOfOthers = othersPercentage
            }
        }
        
        // 4) Assign the correct answer’s portion
        distribution[correct] = correctPercentage
        return distribution
    }

    
    // x2.
    func useX2() {
        guard jokers.x2Unlocked && !jokers.usedX2 else { return }
        jokers.usedX2 = true
    }
}
