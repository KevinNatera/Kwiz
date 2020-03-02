//
//  UserModel.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/6/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation

class User {
    var highestScore: Int
    var nickname: String
    
    init(highestScore: Int, nickname: String) {
        self.highestScore = highestScore
        self.nickname = nickname
    }
    func startGame() {
        print("start game")
    }
    
    func changeSettings(){
        print("changeSettings")
    }
    
    func play(){
        print("play")
        
    }
    func pickAnswer() -> Int {
        print("user picks an answer")
        return 1
    }
    
    func enterName(name: String) {
        print("enterName")
        nickname = name
    }
    
    func updateHighScore(newCurrentScore: Int) {
        if newCurrentScore > highestScore {
            highestScore = newCurrentScore
        }
    }
    
}
