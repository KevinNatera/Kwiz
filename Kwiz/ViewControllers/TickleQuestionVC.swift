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
        label.frame = CGRect(x: view.center.x - 200, y: 100, width: 400, height: 50)
        label.backgroundColor = .red
        label.text = "How many tickles does it take to make a squid laugh?"
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var wrongAnswer1: UIButton = {
        let button = UIButton()
        button.setTitle("Like three", for: .normal)
        button.frame = CGRect(x: view.center.x - 150, y: 250, width: 300, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(wrongAnswerPressed), for: .touchUpInside)
        return  button
    }()
    
    lazy var wrongAnswer2: UIButton = {
        let button = UIButton()
        button.setTitle("The Right Answer", for: .normal)
        button.frame = CGRect(x: view.center.x - 150, y: 350, width: 300, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(wrongAnswerPressed), for: .touchUpInside)
        return  button
    }()
    
    lazy var wrongAnswer3: UIButton = {
        let button = UIButton()
        button.setTitle("Witty Spongebob Reference", for: .normal)
        button.frame = CGRect(x: view.center.x - 150, y: 450, width: 300, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(wrongAnswerPressed), for: .touchUpInside)
        return  button
    }()
    
    lazy var correctAnswer: UIButton = {
        let button = UIButton()
        button.setTitle(">:(", for: .normal)
        button.frame = CGRect(x: view.center.x - 150, y: 550, width: 300, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(wrongAnswerPressed), for: .touchUpInside)
        return  button
    }()
    
    var heartStack = HeartsStackView(livesRemaining: Game.shared.getLives())
    
    
    
    //MARK: - ViewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setUpLivesStackView()
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
            
            let direction = Int.random(in: 1...4)
            
            switch direction {
            case 1...2:
                UIView.animate(withDuration: 0.1, animations: {
                    self.correctAnswer.frame = CGRect(x: self.correctAnswer.frame.minX + 1 , y: self.correctAnswer.frame.minY, width: self.correctAnswer.frame.width, height: self.correctAnswer.frame.height)
                    
                }) { (bool) in
                    
                    self.correctAnswer.frame = CGRect(x: self.correctAnswer.frame.minX - 1 , y: self.correctAnswer.frame.minY, width: self.correctAnswer.frame.width, height: self.correctAnswer.frame.height)
                }
            case 3...4:
                UIView.animate(withDuration: 0.1, animations: {
                    self.correctAnswer.frame = CGRect(x: self.correctAnswer.frame.minX - 1 , y: self.correctAnswer.frame.minY, width: self.correctAnswer.frame.width, height: self.correctAnswer.frame.height)
                    
                    
                }) { (bool) in
                    
                    self.correctAnswer.frame = CGRect(x: self.correctAnswer.frame.minX + 1 , y: self.correctAnswer.frame.minY, width: self.correctAnswer.frame.width, height: self.correctAnswer.frame.height)
                }
                
            default:
                print("oops")
            }
            
            
            if tickles < 10.0 {
                
                correctAnswer.setTitle(String(Int(tickles)), for: .normal)
                
                //animation logic
                
                print(tickles)
            } else {
                
                correctAnswer.setTitle("TEN-TICKLES!!! :D", for: .normal)
                correctAnswer.backgroundColor = .green
                //Trigger segue into next question after a delay
                tickles = 0
                Game.shared.increaseScoreForSpecialQuestions()
                Game.shared.switchAndGetNextTypeOfQuestion()
                let vc = useNextTypeToCallVC(nextType: Game.shared.getNextType())
                navigationController?.pushViewController(vc, animated: true)
                
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
        view.addSubview(heartStack)
        
    }
    private func setUpLivesStackView(){
            heartStack.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                heartStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                heartStack.widthAnchor.constraint(equalToConstant: 150),
                heartStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                heartStack.heightAnchor.constraint(equalToConstant: 60)
            ])
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



