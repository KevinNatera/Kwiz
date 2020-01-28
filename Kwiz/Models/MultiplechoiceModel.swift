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
    
    init (question: String, allAnswers: [Int: String]){
        
        self.allAnswers = allAnswers
        self.question = question
    }
}
