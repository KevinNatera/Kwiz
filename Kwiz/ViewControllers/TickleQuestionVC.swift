//
//  TickleQuestionVC.swift
//  Kwiz
//
//  Created by Kevin Natera on 1/30/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation
import UIKit

class TickleQuestionVC: UIViewController {
    //MARK: - Properties
    
    var lives = 3
    var tickles = 1.01
    
    lazy var question: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: view.center.x - 100, y: 100, width: 200, height: 50)
        label.backgroundColor = .red
        label.text = "THIS IS A QUESTION BOII"
        label.textColor = .black
        return label
    }()
    
    lazy var wrongAnswer1: UIButton = {
        let button = UIButton()
        button.setTitle("WRONG ANSWER 1", for: .normal)
        button.frame = CGRect(x: view.center.x - 100, y: 250, width: 200, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(wrongAnswerPressed), for: .touchUpInside)
        return  button
    }()
    
    lazy var wrongAnswer2: UIButton = {
        let button = UIButton()
        button.setTitle("WRONG ANSWER 2", for: .normal)
        button.frame = CGRect(x: view.center.x - 100, y: 350, width: 200, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(wrongAnswerPressed), for: .touchUpInside)
        return  button
    }()
    
    lazy var wrongAnswer3: UIButton = {
        let button = UIButton()
        button.setTitle("WRONG ANSWER 3", for: .normal)
        button.frame = CGRect(x: view.center.x - 100, y: 450, width: 200, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(wrongAnswerPressed), for: .touchUpInside)
        return  button
    }()
    
    lazy var correctAnswer: UIButton = {
        let button = UIButton()
        button.setTitle("WRONG ANSWER >:(", for: .normal)
        button.frame = CGRect(x: view.center.x - 100, y: 550, width: 200, height: 50)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(wrongAnswerPressed), for: .touchUpInside)
        return  button
    }()
    
    
    
    
    //MARK: - ViewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        randomizeAnswers()
    }
    
    //MARK: - Objc Funcs
    
    @objc func wrongAnswerPressed(sender: UIButton) {
        
        lives -= 1
        
        print("lives \(lives)")
        if lives <= 0 {
            //Trigger Game Over Sequence
            print("gg scrub")
        }
    }
    
    
    
    @objc func swipeHandler(gestureRecognizer : UIPanGestureRecognizer) {
        
        
        if correctAnswer.frame.contains(gestureRecognizer.location(in: self.view)) {
            tickles += 0.02
            
            if tickles < 10.1 {
                
                correctAnswer.setTitle(String(Int(tickles)), for: .normal)
                
                //animation logic
                
                print(tickles)
            } else {
                
                correctAnswer.setTitle("Correct!!!", for: .normal)
                //Trigger segue into next question
                print("grats")
            }
            
        }
    }
    
    //MARK: - Private Funcs
    
    private func addSubViews() {
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeHandler(gestureRecognizer:))))
        view.backgroundColor = .purple
        view.addSubview(question)
        view.addSubview(wrongAnswer1)
        view.addSubview(wrongAnswer2)
        view.addSubview(wrongAnswer3)
        view.addSubview(correctAnswer)
    }
    
    private func randomizeAnswers() {
        let num = Int.random(in: 1...8)
        
        switch num {
        case 1...2 :
            //2143
            let tempFrame1 = wrongAnswer1.frame
            let tempFrame3 = wrongAnswer3.frame
            
            wrongAnswer1.frame = wrongAnswer2.frame
            wrongAnswer2.frame = tempFrame1
            wrongAnswer3.frame = correctAnswer.frame
            correctAnswer.frame = tempFrame3
            
        //3421
        case 3...4:
            let tempFrame1 = wrongAnswer1.frame
            let tempFrame2 = wrongAnswer2.frame
            
            wrongAnswer1.frame = correctAnswer.frame
            wrongAnswer2.frame = wrongAnswer3.frame
            wrongAnswer3.frame = tempFrame1
            correctAnswer.frame = tempFrame2
            
        case 5...6:
            //4312
            let tempFrame1 = wrongAnswer1.frame
            let tempFrame2 = wrongAnswer2.frame
            
            wrongAnswer1.frame = wrongAnswer3.frame
            wrongAnswer2.frame = correctAnswer.frame
            wrongAnswer3.frame = tempFrame2
            correctAnswer.frame = tempFrame1
            
        default:
            //1234
            print("default")
        }
    }
    
}



