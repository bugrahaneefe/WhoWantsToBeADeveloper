import SwiftUI

public enum Constant {
    // MARK: Questions
    static let allQuestions: [Question] = [
        // Level 1 - Beginner
        
        Question(text: "What is the primary purpose of Swift language?",
                 options: ["To develop desktop applications", "To develop web applications", "To develop iOS applications", "To write assembly-level programs"],
                 correctAnswer: "To develop iOS applications",
                 level: 1,
                 image: nil,
                 timeLimit: 10),
        
        Question(text: "Which language is primarily used for iOS development?",
                 options: ["Swift", "Java", "Python", "Kotlin"],
                 correctAnswer: "Swift",
                 level: 1,
                 image: nil,
                 timeLimit: 10),
        
        Question(text: "What does Xcode do?",
                 options: ["Text Editing", "Game Development", "iOS App Development", "Video Editing"],
                 correctAnswer: "iOS App Development",
                 level: 1,
                 image: nil,
                 timeLimit: 10),
        
        Question(
            text: "What does the bitten apple in Apple's logo symbolize?",
            options: [
                "Distinction from other fruits and tech companies",
                "A tribute to Alan Turing",
                "The concept of digital evolution",
                "The power of artificial intelligence"
            ],
            correctAnswer: "Distinction from other fruits and tech companies",
            level: 1,
            image: Image("applelogo"),
            timeLimit: nil
        ),
        
        // Level 2 - Rookie Developer
        
        Question(text: "How do you define a function in Swift?",
                 options: ["func myFunction() {}", "function myFunction {}", "def myFunction():", "void myFunction() {}"],
                 correctAnswer: "func myFunction() {}",
                 level: 2,
                 image: nil,
                 timeLimit: 15),
        
        Question(text: "Which keyword should replace ___ ?",
                 options: ["let", "var", "func", "computed"], 
                 correctAnswer: "var", 
                 level: 2,
                 image: Image("qImage_1"),
                 timeLimit: 15),
        
        Question(text: "What would be the output of reversePrint('apple') ?",
                 options: ["a p p l e", "ellpa", "elppa", "eppla"],
                 correctAnswer: "elppa",
                 level: 2,
                 image: Image("qImage_4"),
                 timeLimit: 15),
        
        // Level 3 - Intern Developer
        
        Question(text: "Which of the following is a valid way to declare a constant in Swift?",
                 options: ["first", "second", "third", "fourth"],
                 correctAnswer: "first",
                 level: 3,
                 image: Image("qImage_2"),
                 timeLimit: 20),
        
        Question(text: "Which file format is used for iOS Storyboards?",
                 options: [".xml", ".storyboard", ".swift", ".json"], 
                 correctAnswer: ".storyboard", 
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        
        Question(text: "What does the 'weak' keyword do in Swift?",
                 options: ["Prevents memory leaks", "Increases performance", "Removes type safety", "Makes a variable mutable"],
                 correctAnswer: "Prevents memory leaks",
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        
        Question(text: "What does ! mean in Swift?",
                 options: ["It is used to indicate forced unwrapping of an optional", "It is used to declare a constant", "It is used to mark a variable as optional", "It is used for comments"],
                 correctAnswer: "It is used to indicate forced unwrapping of an optional",
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        
        Question(text: "What is the recommended way to store small amounts of persistent data in iOS?",
                 options: ["UserDefaults", "Core Data", "SQLite", "Realm"],
                 correctAnswer: "UserDefaults",
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        
        Question(text: "What is a Swift Package Manager (SPM) used for?",
                 options: ["Creating third-party libraries", "Managing dependencies", "Creating UI elements", "Logging errors"],
                 correctAnswer: "Managing dependencies",
                 level: 3,
                 image: nil,
                 timeLimit: 20),
        
        // Level 4 - Junior Developer
        
        Question(text: "What does MVC stand for?",
                 options: ["Model View Controller", "Module View Code", "Main View Class", "Model View ViewModel"], 
                 correctAnswer: "Model View Controller", 
                 level: 4,
                 image: nil,
                 timeLimit: 25),
        
        Question(text: "Which collection type in Swift does not allow duplicate values?",
                 options: ["Array", "Dictionary", "Set", "Tuple"],
                 correctAnswer: "Set",
                 level: 4,
                 image: nil,
                 timeLimit: 25),
        
        Question(text: "How do you navigate from one UIViewController to another in UIKit?",
                 options: ["present(_:animated:completion:)", "navigateTo(_:)", "push(_:animated:)", "switchViewController()"],
                 correctAnswer: "present(_:animated:completion:)",
                 level: 4,
                 image: nil,
                 timeLimit: 25),
        
        Question(text: "What is the time complexity of binary search?",
                 options: ["O(n)", "O(log n)", "O(n log n)", "O(1)"],
                 correctAnswer: "O(log n)",
                 level: 4,
                 image: nil,
                 timeLimit: 25),
        
        Question(text: "Which keyword is used to declare a constant in Swift?",
                 options: ["let", "var", "const", "final"], 
                 correctAnswer: "let", 
                 level: 4,
                 image: nil,
                 timeLimit: 25),
        
        Question(text: "Which Swift framework is used for UI development?",
                 options: ["UIKit", "Foundation", "CoreData", "SQLite"], 
                 correctAnswer: "UIKit", 
                 level: 4,
                 image: nil,
                 timeLimit: 25),
        
        Question(text: "Which design pattern is SwiftUI based on?",
                 options: ["MVVM", "MVC", "VIPER", "Singleton"],
                 correctAnswer: "MVVM",
                 level: 4,
                 image: nil,
                 timeLimit: 25),
        
        Question(text: "Which design pattern is used to create objects without specifying their exact class, allowing subclasses to alter the type of objects that are created?",
                 options: ["Singleton Pattern", "Factory Pattern", "Observer Pattern", "Prototype Pattern"],
                 correctAnswer: "Factory Pattern",
                 level: 4,
                 image: Image("qImage_6"),
                 timeLimit: 25),
        
        // Level 5 - Mid-Level Developer
        
        Question(text: "What is the compile error in the above Swift code snippet?",
                 options: ["The species property is a let constant and cannot be reassigned", "The init method is incorrect and cannot initialize a let property", "The changeSpecies method should be marked as static", "Classes in Swift cannot have methods that modify properties"],
                 correctAnswer: "The species property is a let constant and cannot be reassigned",
                 level: 5,
                 image: Image("qImage_5"),
                 timeLimit: 30),
        
        Question(text: "Which of the following is NOT a Swift data type?",
                 options: ["Int", "Double", "Decimal", "Float"], 
                 correctAnswer: "Decimal", 
                 level: 5,
                 image: nil,
                 timeLimit: 30),
        
        Question(text: "What is a delegate in Swift?",
                 options: ["A design pattern for communication between objects",
                           "A keyword used for memory management",
                           "A function that executes asynchronously",
                           "A type of SwiftUI view"],
                 correctAnswer: "A design pattern for communication between objects",
                 level: 5,
                 image: nil,
                 timeLimit: 30),
        
        Question(text: "What is the role of the protocol in Swift?",
                 options: ["A set of methods and properties that suit a particular task or piece of functionality", "A method to send data over the internet", "A way to define optional properties", "None of the above"],
                 correctAnswer: "A set of methods and properties that suit a particular task or piece of functionality",
                 level: 5,
                 image: nil,
                 timeLimit: 30),
        
        Question(text: "What does 'guard' do in Swift?",
                 options: ["Unwraps optionals safely", "Creates loops", "Declares variables", "Creates loops"], 
                 correctAnswer: "Unwraps optionals safely", 
                 level: 5,
                 image: nil,
                 timeLimit: 30),
        
        Question(text: "Which method is called when a UIViewController transitions from one state to another in UIKit?",
                 options: ["viewDidLoad()",
                           "viewDidAppear(_:)",
                           "viewWillTransition(to:with:)",
                           "traitCollectionDidChange(_:)"],
                 correctAnswer: "viewWillTransition(to:with:)",
                 level: 5,
                 image: nil,
                 timeLimit: 30),
        
        // Level 6 - Senior Developer
        
        Question(text: "What is the main advantage of using a lock-free data structure?",
                 options: ["Avoids race conditions completely",
                           "Improves performance by reducing thread contention",
                           "Ensures data consistency without the need for synchronization",
                           "Allows mutable access to shared memory"],
                 correctAnswer: "Improves performance by reducing thread contention",
                 level: 6,
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "Which of the following statements is true?",
                 options: ["The override keyword is incorrectly used on init(value:) in the Child class", "The Parent class does not need a required initializer because it is not a protocol", "The Child class fails to compile because it does not implement the required initializer", "The code compiles successfully and prints expected output"],
                 correctAnswer: "The Child class fails to compile because it does not implement the required initializer",
                 level: 6,
                 image: Image("qImage_7"),
                 timeLimit: nil),
        
        Question(text: "Which of the following best describes the Copy-On-Write mechanism in Swift?",
                 options: ["Optimize value types by sharing storage until mutation",
                           "Allow reference types to behave like value types",
                           "A Swift concurrency model",
                           "Automatic memory management"],
                 correctAnswer: "Optimize value types by sharing storage until mutation",
                 level: 6,
                 image: nil,
                 timeLimit: nil),

        // Level 7 - Team Lead
        
        Question(text: "Which keyword is used for error handling in Swift?",
                 options: ["try", "catch", "throw", "debug"],
                 correctAnswer: "try",
                 level: 7,
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "What does Codable do in Swift?", 
                 options: ["Encodes & Decodes JSON", "Handles UI Animations", "Manages Databases", "Allows mutation during runtime"],
                 correctAnswer: "Encodes & Decodes JSON",
                 level: 7,
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "Which statements about the following Swift code are true?",
                 options: ["It's not legal to reuse the name s on line 1", "The output will be BAR.", "The value of a is undefined after line 3", "There is a compile error on line 3"],
                 correctAnswer: "The output will be BAR.",
                 level: 7,
                 image: Image("qImage_3"),
                 timeLimit: nil),
        
        // Level 8 - Tech Lead
        
        Question(text: "What is Combine used for in Swift?",
                 options: ["Data binding & reactive programming", "UI animations", "Game development"], 
                 correctAnswer: "Data binding & reactive programming", 
                 level: 8,
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "What happens if you attempt to mutate a property inside an `actor` in Swift from outside?",
                 options: ["The mutation will fail at compile time unless marked as `@MainActor`",
                           "It will execute normally but might cause a race condition",
                           "Swift will automatically lock access to ensure thread safety",
                           "The mutation will be scheduled asynchronously to prevent data races"],
                 correctAnswer: "The mutation will be scheduled asynchronously to prevent data races",
                 level: 8,
                 image: nil,
                 timeLimit: nil),

        Question(text: "Which protocol is used for networking in Swift?",
                 options: ["URLSession", "Socket", "HTTPHandler", "TCP"],
                 correctAnswer: "URLSession",
                 level: 8,
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "What will be the output of the following Swift code?",
                 options: ["Undefined behavior due to uninitialized superclass", "A initialized followed by B initialized", "Compilation error due to incorrect initializer order", "B initialized followed by A initialized"],
                 correctAnswer: "B initialized followed by A initialized",
                 level: 8,
                 image: Image("qImage_8"),
                 timeLimit: nil),
        
        // Level 9 - Genius Developer
        Question(text: "What is a Swift 'actor' used for?",
                 options: ["Managing async concurrency", "Drawing UI", "Logging errors", "Handling memory management"],
                 correctAnswer: "Managing async concurrency",
                 level: 9,
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "What is App Transport Security (ATS) in iOS?",
                 options: ["Enforces secure connections", "Manages Bluetooth devices", "Optimizes battery usage", "Prevents race condition during transportations"],
                 correctAnswer: "Enforces secure connections",
                 level: 9,
                 image: nil,
                 timeLimit: nil),
        
        Question(text: "In Swift, which of the following statements about value types and reference types is false?",
                 options: ["Structs and enums are value types", "Classes are reference types", "Value types in Swift cannot be modified after initialization", "Reference types are stored in the heap"],
                 correctAnswer: "Value types in Swift cannot be modified after initialization",
                 level: 9,
                 image: nil,
                 timeLimit: nil),
        
        // Level 10 - Apple Developer
        
        Question(text: "What is the best app to learn Swift?",
                 options: ["Who wants to be a developer ?",
                           "Who wants to be a developer ?",
                           "Who wants to be a developer ?",
                           "Who wants to be a developer ?"],
                 correctAnswer: "Who wants to be a developer ?",
                 level: 10,
                 image: Image("applelogo"),
                 timeLimit: nil)
    ]
    
    static let levels = [
        "1..............Beginner",
        "2......Rookie Developer",
        "3......Intern Developer",
        "4......Junior Developer",
        "5...Mid-level Developer",
        "6......Senior Developer",
        "7.............Team Lead",
        "8.............Tech Lead",
        "9......Genius Developer",
        "10......Apple Developer"
    ]
    
    static let gameOver = "Try next time !"
    static let restart = "Restart"
    static let start = "Start"
    static let congrats = "Congratulations! \n You are eligible to be Apple Developer."
    static let toStartMenu = "Go to Start Menu"
    static let aiTitle = "AI Suggestions"
    static let done = "Done"
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
    private var x2AlreadyUsed: Bool = false
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
        x2AlreadyUsed = false
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
                
        // show the level chart for 2 seconds on each new question.
        showLevelChart = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showLevelChart = false
            
            // all options visible by default.
            if let question = self.currentQuestion {
                self.visibleOptions = question.options
                
                // time limit if question has.
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
            // count view.
            var clockPlayed = false
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                
                if self.currentCountdown < 6 && !clockPlayed {
                    SoundManager.shared.playSound(named: "clock")
                    clockPlayed = true
                }
                
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
            if jokers.usedX2 {
                x2AlreadyUsed = true
            }
            if currentLevel == 10 {
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
            if jokers.usedX2 && guessesThisQuestion == 1 && !x2AlreadyUsed {
                lockedWrongX2Option = userSelection
                correctAnswerRevealed = false
                self.userSelection = nil
                x2AlreadyUsed = true
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.visibleOptions.removeAll(where: { toRemove.contains($0) })
            }
        }
    }
    
    // askAI.
    func askAI(for question: Question) {
        guard !jokers.usedAskAI else { return }
        jokers.usedAskAI = true
        
        aiDistribution = makeRandomDistribution(for: question)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.showAISuggestion = true
        }
    }
    
    private func makeRandomDistribution(for question: Question) -> [String: Int] {
        let correct = question.correctAnswer
        var distribution: [String: Int] = [:]
        
        // random percentage assigned for correct answer
        let baseCorrectMin = max(40 - question.level * 3, 25)
        let baseCorrectMax = min(80 - question.level * 5, 70)
        let correctPercentage = Int.random(in: baseCorrectMin...baseCorrectMax)
        
        // set percentage values of other options
        let othersPercentage = 100 - correctPercentage
        let otherOptions = visibleOptions.filter { $0 != correct }
        
        var sumOfOthers = 0
        for i in 0..<otherOptions.count {
            let isLast = (i == otherOptions.count - 1)
            
            if !isLast {
                let maxPossible = min(correctPercentage - 1, othersPercentage - sumOfOthers - 5 * (otherOptions.count - i - 1))
                if maxPossible <= 5 {
                    distribution[otherOptions[i]] = 5
                    sumOfOthers += 5
                } else {
                    let portion = Int.random(in: 5...maxPossible)
                    distribution[otherOptions[i]] = portion
                    sumOfOthers += portion
                }
            } else {
                distribution[otherOptions[i]] = othersPercentage - sumOfOthers
                sumOfOthers = othersPercentage
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
