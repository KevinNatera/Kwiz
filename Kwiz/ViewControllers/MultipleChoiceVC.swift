//
//  ViewController.swift
//  Kwiz
//
//  Created by Kevin Natera on 1/27/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class MultipleChoiceVC: UIViewController {
    
    lazy var questionTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Times New Roman", size: 14)
        tf.backgroundColor = #colorLiteral(red: 0.9226855636, green: 0.9171560407, blue: 0.9346966743, alpha: 1)
        return tf
        
    }()
    
    lazy var answerChoiceAButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9226855636, green: 0.9171560407, blue: 0.9346966743, alpha: 1)
        button.layer.cornerRadius = 20
        return button
        
    }()
    
    lazy var answerChoiceBButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9226855636, green: 0.9171560407, blue: 0.9346966743, alpha: 1)
        button.layer.cornerRadius = 20
        return button
        
    }()
    
    lazy var answerChoiceCButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9226855636, green: 0.9171560407, blue: 0.9346966743, alpha: 1)
        button.layer.cornerRadius = 20
        return button
        
    }()
    
    lazy var answerChoiceDButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9226855636, green: 0.9171560407, blue: 0.9346966743, alpha: 1)
        button.layer.cornerRadius = 20
        return button
        
    }()
    
    
    lazy var skipButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1684301496, green: 0.1522013843, blue: 0.8870446086, alpha: 1)
        button.setImage(UIImage(named: "skip"), for: .normal)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1684301496, green: 0.1522013843, blue: 0.8870446086, alpha: 1)
        button.setImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    
    lazy var userLivesImageOne: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
       
        return imageView
    }()
    lazy var userLivesImageTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
       
        return imageView
    }()
    
    lazy var userLivesImageThree: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
       
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()
        view.backgroundColor = #colorLiteral(red: 0.1684301496, green: 0.1522013843, blue: 0.8870446086, alpha: 1)
    }
    
    private func addViews(){
        view.addSubview(questionTextField)
        view.addSubview(answerChoiceAButton)
        view.addSubview(answerChoiceBButton)
        view.addSubview(answerChoiceCButton)
        view.addSubview(answerChoiceDButton)
        view.addSubview(skipButton)
        view.addSubview(backButton)
        view.addSubview(userLivesImageOne)
        view.addSubview(userLivesImageTwo)
        view.addSubview(userLivesImageThree)
        
    }
    
    private func addConstraints(){
        setUpQuestionTF()
        setUpAnswersStackView()
        setUpBackButton()
        setUpSkipButton()
        setUpLivesStackView()
        
    }
    
    private func setUpQuestionTF(){
        questionTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            questionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            questionTextField.heightAnchor.constraint(equalToConstant: 100),
            questionTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            
            questionTextField.bottomAnchor.constraint(equalTo: answerChoiceAButton.topAnchor, constant:
                50),
            
        ])
        
    }
    
    private func setUpAnswersStackView(){
        let stackView = UIStackView(arrangedSubviews: [answerChoiceAButton, answerChoiceBButton, answerChoiceCButton, answerChoiceDButton])
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            stackView.leadingAnchor.constraint(equalTo: questionTextField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: questionTextField.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 50)
        ])
    }
    
    private func setUpBackButton(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            backButton.heightAnchor.constraint(equalToConstant: 90),
            backButton.bottomAnchor.constraint(equalTo: questionTextField.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    private func setUpSkipButton(){
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButton.leadingAnchor.constraint(equalTo: questionTextField.trailingAnchor, constant: 5),
            skipButton.heightAnchor.constraint(equalToConstant: 70),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            skipButton.bottomAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: -20),
        ])
        
    }
    
    private func setUpLivesStackView(){
        let stackView = UIStackView(arrangedSubviews: [userLivesImageOne, userLivesImageTwo, userLivesImageThree])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 80),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: questionTextField.topAnchor)

        ])
        
        
    }
    
    
    
}


