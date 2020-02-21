//
//  CorrectAnswerView.swift
//  Kwiz
//
//  Created by Pursuit on 2/10/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

enum UserResult {
    case correct
    case wrong
}

class AnswerAlert {
    static let shared = AnswerAlert()
    
    func answerResult(userResult:UserResult, viewController: UIViewController){
        switch userResult {
        case .correct:
            let alert = UIAlertController(title: "Correct!", message: "Congratulations! You gained 5 points!", preferredStyle: .alert)
            viewController.present(alert, animated: true)
            
            
        case .wrong:
            let alert = UIAlertController(title: "Wrong", message: "Try again!", preferredStyle: .alert)
            viewController.present(alert, animated: true)
            
        }
    }
    
    
}
    
   

    
    
    
    
    


