//
//  GameModel.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/6/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation
enum LivesRemaining: Int {
    case three = 3
    case two = 2
    case one = 1
    case none = 0
}

class Game {
    static let shared = Game()
    private var lives: LivesRemaining
    private var score: Int
    private var user: User?
    private var questions: [Multiplechoice]
    
    
    
    /// game requires user to exist, games always start with 3 lives and a score of 0
    /// - Parameter user: <#user description#>
    private init() {
        lives = LivesRemaining.three
        score = 0
        
        //self.user = user
        
        questions = Game.getQuestions()
    }
    func setUser(user: User) {
        self.user = user
    }
    
    /// internal game function to get questions
   static private func getQuestions() -> [Multiplechoice] {
        return [Multiplechoice(question: "What key can't open locks?", allAnswers: [Answer(text: "donkeys", isCorrect: .correct)
        ,Answer(text: "super keys", isCorrect: .incorrect)
        ,Answer(text: "falcon keys", isCorrect: .incorrect)
        ,Answer(text: "bit keys", isCorrect: .incorrect)]
        , questionValue: 50),
                
                Multiplechoice(question: "2222 What key can't open locks?", allAnswers: [Answer(text: "donkeys", isCorrect: .correct)
                ,Answer(text: "super keys", isCorrect: .incorrect)
                ,Answer(text: "falcon keys", isCorrect: .incorrect)
                ,Answer(text: "bit keys", isCorrect: .incorrect)]
                , questionValue: 50)
    
    
    
    ]
    }
    
    func shuffle(){
        print("shuffle")
        print("segue to multipleChoice VC")
//        questions.first?.shuffleAnswers()
        
        questions.shuffle()
        
        questions.forEach({ $0.shuffleAnswers() } )
    }
    
    func increaseScore(){
        print("score")
        score += 1
    }
    
    func reduceLives(){
        switchOnLives()
    }
    
    func start() {
        print("start/restart")
        user?.startGame()
        user?.play()
        read()
    }
    
    func quit(){
        print("quit")
        print("back to main view controller")
    }
    
    func timer(){
        print("timer")
    }
    
    func skip(){
        print("skip")
        //user?.nextQuestion()
    }
    
    func read() -> String {
        print("view controller loads question")
        return questions[0].readQuestion()
    }
    func getAnswerTexts() -> [String] {
        return questions[0].getAnswerTexts()
    }
    func answer(_ ans: Int) -> Bool {
        print("answer picked")
        if questions[0].guess(answer: ans) {
            increaseScore()
            return true
        } else {
            switchOnLives()
            return false
        }
    }
    private func switchOnLives() {
        switch lives {
        case .three:
            lives = .two
        case .two:
            lives = .one
        case .one:
            lives = .none
        case .none:
            quit()
        }
    }
    func getLives() -> LivesRemaining {
        return lives
    }
    
    /// global game score
    func getCurrentScore() {
        print("recieve \(score)")
        //Show user score, current score
    }
}
