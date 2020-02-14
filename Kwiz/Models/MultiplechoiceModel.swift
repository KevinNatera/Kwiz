//
//  MultiplechoiceModel.swift
//  Kwiz
//
//  Created by EricM on 1/28/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation

class Multiplechoice {
    private var question: String
    //var allAnswers: [Int: String]
    private var questionValue: Int
    private var allAnswers: [Answer]
    
    init (question: String, allAnswers: [Answer], questionValue: Int){
        
        self.allAnswers = allAnswers
        self.question = question
        self.questionValue = questionValue
    }
    
    func readQuestion() -> String {
        print(question)
        return question
//        for a in allAnswers {
//            print(a.getText())
//        }
    }
    func getAnswerTexts() -> [String] {
        var texts = [String]()
        for a in allAnswers {
            texts.append(a.getText())
        }
        return texts
    }
    func shuffleAnswers() {
        allAnswers = allAnswers.shuffled()
    }
    
    /// find Answer for [answer]
    /// switch on correctness of Answer
    /// - Parameter answer: takes in 0 - number of answers
    /// - Returns: true if right or false if not
    func guess(answer: Int) -> Bool {
        guard answer <= allAnswers.count - 1 else { return false }
        let chosen = allAnswers[answer]
        if chosen.isCorrect() == .correct {
            return true
        } else {
            return false
        }
    }
    
    /// Returns question point value
    func getPoints() -> Int {
        return questionValue
    }
}
class Answer {
    private var text: String
    private var correct: Correctness
    enum Correctness {
        case correct
        case incorrect
    }
    init(text: String, isCorrect: Correctness) {
        self.text = text
        self.correct = isCorrect
    }
    func isCorrect() -> Correctness {
        return correct
    }
    func getText() -> String {
        return text
    }
}
