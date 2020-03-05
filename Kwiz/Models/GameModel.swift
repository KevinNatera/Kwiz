//
//  GameModel.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/6/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation
import GameKit
enum LivesRemaining: Int {
    case three = 3
    case two = 2
    case one = 1
    case none = 0
}
enum NextTypeOfQuestion {
    case firstMC
    case secondMC
    case special
}

class Game {
    static let shared = Game()
    private var lives: LivesRemaining
    private var score: Int
    private var user: User?
    private var questions: [Multiplechoice]
    private var currentQuestion: Multiplechoice?
    private var specialQuestions: [SpecialQuestion]
    private var currentSQ: SpecialQuestion?
    private var nextType: NextTypeOfQuestion
    
    
    /// game requires user to exist, games always start with 3 lives and a score of 0
    /// - Parameter user: <#user description#>
    private init() {
        lives = LivesRemaining.three
        score = 0
        questions = Game.getQuestions().shuffled()
        questions.forEach({ $0.shuffleAnswers() } )
        specialQuestions = allSpecialQuestions.shuffled()
        nextType = .firstMC
    }
    
    //MARK: - Questions
    /// internal game function to get questions
   static private func getQuestions() -> [Multiplechoice] {
        return [Multiplechoice(question: "What key can't open locks?", allAnswers: [Answer(text: "Donkeys", isCorrect: .correct)
        ,Answer(text: "Super keys", isCorrect: .incorrect)
        ,Answer(text: "Falcon keys", isCorrect: .incorrect)
        ,Answer(text: "Bit keys", isCorrect: .incorrect)]
        , questionValue: 5),
                
                Multiplechoice(question: "What makes a vacuum good?", allAnswers: [Answer(text: "It sucks", isCorrect: .correct)
                ,Answer(text: "Capacity", isCorrect: .incorrect)
                ,Answer(text: "Dust devourer", isCorrect: .incorrect)
                ,Answer(text: "Cleaner", isCorrect: .incorrect)]
                , questionValue: 5),
                Multiplechoice(question: "I have 10 cookies and you took 5, what do you have?", allAnswers: [Answer(text: "A black eye and a broken hand", isCorrect: .correct)
                ,Answer(text: "5 cookies", isCorrect: .incorrect)
                ,Answer(text: "Joy", isCorrect: .incorrect)
                ,Answer(text: "A sweet tooth", isCorrect: .incorrect)]
                , questionValue: 5),
    Multiplechoice(question: "Where is the best place to hide something?", allAnswers: [Answer(text: "Link to the second page on google", isCorrect: .correct)
    ,Answer(text: "In a forest", isCorrect: .incorrect)
    ,Answer(text: "Your pocket", isCorrect: .incorrect)
    ,Answer(text: "Plain sight", isCorrect: .incorrect)]
    , questionValue: 5),
    Multiplechoice(question: "What is the most curious letter?", allAnswers: [Answer(text: "The letter Y", isCorrect: .correct)
    ,Answer(text: "The letter C", isCorrect: .incorrect)
    ,Answer(text: "A love letter", isCorrect: .incorrect)
    ,Answer(text: "The letter Q", isCorrect: .incorrect)]
    , questionValue: 5),
    Multiplechoice(question: "You're in a dark cave with only one match, a lump of coal, a stove, and a kerosene lamp. You have the option of lighting one. Which do you light first?", allAnswers: [Answer(text: "The match", isCorrect: .correct)
    ,Answer(text: "The lump of coal", isCorrect: .incorrect)
    ,Answer(text: "The stove", isCorrect: .incorrect)
    ,Answer(text: "The kerosene lamp", isCorrect: .incorrect)]
    , questionValue: 5),
    Multiplechoice(question: "I have a head like a cat. I have feet like a cat, but I am not a cat. What am I?", allAnswers: [Answer(text: "A kitten", isCorrect: .correct)
    ,Answer(text: "A fox", isCorrect: .incorrect)
    ,Answer(text: "A mongoose", isCorrect: .incorrect)
    ,Answer(text: "A pokemon", isCorrect: .incorrect)]
    , questionValue: 5)]
    }
    
    func shuffle(){
        print("shuffle")
        questions.shuffle()
        questions.forEach({ $0.shuffleAnswers() } )
        specialQuestions = allSpecialQuestions.shuffled()
        //getNewCurrentQuestion()
    }
    func getNewCurrentQuestion() {
        currentQuestion = questions.popLast()
    }
    func isQuestionsEmpty() -> Bool {
        return questions.isEmpty
    }
    
    
    func getCurrentQuestion() -> Multiplechoice? {
        return currentQuestion
    }
    func getQuestionText() -> String {
        if let question = currentQuestion {
            return question.readQuestion()
        } else {
            return ""
        }
       
    }
    func getAnswerTexts() -> [String] {
        if let question = currentQuestion {
            return question.getAnswerTexts()
        } else {
            return ["","","",""]
        }
    }
    func answer(_ ans: Int) -> Bool {
        print("answer picked")
        if let question = currentQuestion {
            if question.guess(answer: ans) {
                increaseScore()
                return true
            } else {
                switchOnLives()
                return false
            }
        }
        return false
    }
    func switchAndGetNextTypeOfQuestion() {
        switch nextType {
        case .firstMC:
            getNewCurrentQuestion()
            if let _ = currentQuestion {
                nextType = .secondMC
            } else {
                getNewSpecialQuestion()
                if let _ = currentSQ {
                    nextType = .special
                } else {
                    quit()
                }
            }
        case .secondMC:
            getNewSpecialQuestion()
            if let _ = currentSQ {
                nextType = .special
            } else {
                getNewCurrentQuestion()
                if let _ = currentQuestion {
                    nextType = .firstMC
                } else {
                    quit()
                }
            }
        case .special:
            getNewCurrentQuestion()
            if let _ = currentQuestion {
                nextType = .firstMC
            } else {
                getNewSpecialQuestion()
                if let _ = currentSQ {
                    nextType = .special
                } else {
                    quit()
                }
            }
        }
    }
    
    //MARK: - Special Questions
    func getNewSpecialQuestion() {
        currentSQ = specialQuestions.popLast()
    }
    func getCurrentSpecialQuestion() -> SpecialQuestion? {
        return currentSQ
    }
    func increaseScoreForSpecialQuestions() {
        if let question = currentSQ {
            score += question.points
            user!.updateHighScore(newCurrentScore: score)
            updatesGameCenter()
        }
    }
    
    //MARK: - User
    func setUser(user: User) {
        self.user = user
    }
    func reduceLives(){
        switchOnLives()
    }
    
    func start() {
        print("start/restart")
        lives = .three
        nextType = .firstMC
        score = 0
        questions = Game.getQuestions()
        user?.startGame()
        user?.play()
        shuffle()
        //switchAndGetNextTypeOfQuestion()
    }
    
    //MARK: - Game
    func quit(){
        print("quit")
        print("back to main view controller")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {return}
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                window.rootViewController = ResultsVC()
        }, completion: nil)
    }
    
    func timer(){
        print("timer")
    }
    
    func skip(){
        print("skip")
        //user?.nextQuestion()
    }
    
    
    private func switchOnLives() {
        switch lives {
        case .three:
            lives = .two
        case .two:
            lives = .one
        case .one:
            lives = .none
            quit()
        case .none:
            quit()
        }
    }
    func getLives() -> LivesRemaining {
        return lives
    }
    
    func increaseScore(){
        print("score")
        if let question = currentQuestion {
            score += question.getPoints()
            user!.updateHighScore(newCurrentScore: score)
            updatesGameCenter()
        }
    }
    func getNextType() -> NextTypeOfQuestion {
        return nextType
    }
    
    /// global game score
    /// - Returns: users score(Int)
    func getCurrentScore()-> Int {
        //return user?.highestScore ?? 0
        return score
        //Show user score, current score
    }
    
    //MARK: - GameCenter
    func updatesGameCenter() {
        saveScore()
        checkFinishAchievement()
    }
    func checkFinishAchievement(){
        let totalQValue = (Game.getQuestions().count * 5) + (allSpecialQuestions.count * 10)
        if(score >= totalQValue) {
            let achieved = GKAchievement(identifier: "kwiz.achievement.finished", player: GKLocalPlayer.local)
            achieved.percentComplete = 100
            achieved.showsCompletionBanner = true
            //GKAchievement.resetAchievements(completionHandler: nil)
            let achievementArr: [GKAchievement] = [achieved]
            GKAchievement.report(achievementArr, withCompletionHandler: nil)
        }
    }
    func saveScore(){
        if GKLocalPlayer.local.isAuthenticated {
            let scoreResponse = GKScore(leaderboardIdentifier: "kwiz.leaderboard.highscore")
            scoreResponse.value = Int64(score)
            let scoreArr: [GKScore] = [scoreResponse]
            GKScore.report(scoreArr, withCompletionHandler: nil)
        }
    }
}
