//
//  GameModel.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/6/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation

class Game {
    private var lives: Int
    private var score: Int
    private var user: User?
    private var question: Multiplechoice
    
    
    init(user: User?) {
         lives = 3
         score = 0
        if let user = user {
            self.user = user
        } else {
            let user = User(highestScore: 0, nickname: "bob")
            user.enterName(name: "Bob")
            self.user = user
        }
        
        question = Multiplechoice(question: "What key can't open locks?", allAnswers: [1:"donkeys",2:"super keys",3:"falcon keys",4:"Bit keys"], questionValue: 10)
    }
    
    func shuffle(){
        print("shuffle")
    }
    
    func increaseScore(){
        print("score")
        score += 1
    }
    
    func reduceLives(){
        print("reduce lives")
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
    
    func read(){
        print("view controller loads question")
        let questionLabel = question.question
        let buttonOne = question.allAnswers[1]
        let buttonTwo = question.allAnswers[2]
        let buttonThree = question.allAnswers[3]
        let buttonFour = question.allAnswers[4]
    }
    func answer() -> Bool {
        let ans = user?.pickAnswer()
        print("answer picked")
        if ans == 1 {
            increaseScore()
            return true
        } else {
            return false
        }
    }
    func recieveScore(){
        print("recieve \(score)")
    }
}
