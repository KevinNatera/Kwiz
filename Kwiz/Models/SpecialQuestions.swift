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
    //var hint: String { get }
}

class Advertisement: SpecialQuestion {
    private var howToAnswer: String
    var points: Int
    
    init(howToAnswer: String, points: Int) {
        self.howToAnswer = howToAnswer
        self.points = points
    }
    
    static let question = Advertisement(howToAnswer: "Click on download button", points: 10)
}

class Tickle: SpecialQuestion {
    private var howToAnswer: String
    var points : Int
    
    init(howToAnswer: String, points: Int) {
        self.howToAnswer = howToAnswer
        self.points = points
    }
    
    static let question = Tickle(howToAnswer: "Tickle the frown-y button until it reaches 10", points: 10)
}

class Scale: SpecialQuestion {
    private var howToAnswer: String
    var points : Int
    
    init(howToAnswer: String, points: Int) {
        self.howToAnswer = howToAnswer
        self.points = points
    }
    
    static let question = Scale(howToAnswer: "Drag the steel box under the box with ?", points: 10)
}

class Lock: SpecialQuestion {
    private var howToAnswer: String
    var points : Int
    
    init(howToAnswer: String, points: Int) {
        self.howToAnswer = howToAnswer
        self.points = points
    }
    
    static let question = Lock(howToAnswer: "Turn the door handle down all the way", points: 10)
}

let allSpecialQuestions: [SpecialQuestion] = [Advertisement.question,Tickle.question,Scale.question,Lock.question]
