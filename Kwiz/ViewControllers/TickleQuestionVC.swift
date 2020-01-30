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
        return  button
    }()
    
    lazy var wrongAnswer2: UIButton = {
        let button = UIButton()
        button.setTitle("WRONG ANSWER 2", for: .normal)
        button.frame = CGRect(x: view.center.x - 100, y: 350, width: 200, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        return  button
    }()
    
    lazy var wrongAnswer3: UIButton = {
        let button = UIButton()
        button.setTitle("WRONG ANSWER 3", for: .normal)
        button.frame = CGRect(x: view.center.x - 100, y: 450, width: 200, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        return  button
    }()
    
    lazy var correctAnswer: UIButton = {
        let button = UIButton()
        button.setTitle("CORRECT ANSWER", for: .normal)
        button.frame = CGRect(x: view.center.x - 100, y: 550, width: 200, height: 50)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return  button
    }()
    
 
    //MARK: - ViewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        randomizeAnswers()
    }
    
    //MARK: - Private Funcs
    
    private func addSubViews() {
        view.backgroundColor = .purple
        view.addSubview(question)
        view.addSubview(wrongAnswer1)
        view.addSubview(wrongAnswer2)
        view.addSubview(wrongAnswer3)
        view.addSubview(correctAnswer)
        correctAnswer.isUserInteractionEnabled = false
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
    
    
    //MARK: - Touch Funcs
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
      for touch in touches {
      
        let location: CGPoint = touch.location(in: self.view)
        
        if correctAnswer.frame.contains(location) {
            print("correct!!!")
        }
    }
        print(1)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print(2)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(3)
    }
    
    
}



