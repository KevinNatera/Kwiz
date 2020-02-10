//
//  MultiplechoiceModel.swift
//  Kwiz
//
//  Created by EricM on 1/28/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation

class Multiplechoice {
    var question: String
    var allAnswers: [Int: String]
    private var questionValue: Int
    
    init (question: String, allAnswers: [Int: String], questionValue: Int){
        
        self.allAnswers = allAnswers
        self.question = question
        self.questionValue = questionValue
    }
    
    func readQuestion() {
        print("read question")
    }
    func guessAnswer(buttonClicked: Int) {
        print("guess Answer")
    }
    func responseToGuess() {
        print("response")
    }
}
