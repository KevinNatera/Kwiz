//
//  SpecialClasses.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/28/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation
protocol SpecialQuestion {
    var points: Int { get set }
    var hint: String { get set }
}

class Advertisement: SpecialQuestion {
    private var howToAnswer: String
    var points: Int
    var hint: String
    
    init(howToAnswer: String, points: Int, hint: String) {
        self.howToAnswer = howToAnswer
        self.points = points
        self.hint = hint
    }
    
    static let question = Advertisement(howToAnswer: "Click on download button", points: 10, hint: "")
}

class Tickle: SpecialQuestion {
    private var howToAnswer: String
    var points : Int
    var hint: String
    
    init(howToAnswer: String, points: Int, hint: String) {
        self.howToAnswer = howToAnswer
        self.points = points
        self.hint = hint
    }
    
    static let question = Tickle(howToAnswer: "Tickle the frown-y button until it reaches 10", points: 10, hint: "")
}

class Scale: SpecialQuestion {
    private var howToAnswer: String
    var points : Int
    var hint: String
    
    init(howToAnswer: String, points: Int, hint: String) {
        self.howToAnswer = howToAnswer
        self.points = points
        self.hint = hint
    }
    
    static let question = Scale(howToAnswer: "Drag the steel box under the box with ?", points: 10, hint: "")
}

class Lock: SpecialQuestion {
    private var howToAnswer: String
    var points : Int
    var hint: String
    
    init(howToAnswer: String, points: Int, hint: String) {
        self.howToAnswer = howToAnswer
        self.points = points
        self.hint = hint
    }
    
    static let question = Lock(howToAnswer: "Turn the door handle down all the way", points: 10, hint: "")
}

class MovingImage: SpecialQuestion {
    private var howToAnswer: String
    var points : Int
    var hint: String
    
    init(howToAnswer: String, points: Int, hint: String) {
        self.howToAnswer = howToAnswer
        self.points = points
        self.hint = hint
    }
    
    static let question = MovingImage(howToAnswer: "Find the door to to KH", points: 10, hint: "")
}

let allSpecialQuestions: [SpecialQuestion] = [Advertisement.question,Tickle.question,Scale.question,Lock.question,MovingImage.question]
