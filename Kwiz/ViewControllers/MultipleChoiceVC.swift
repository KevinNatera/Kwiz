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
        tf.backgroundColor = .white
        return tf
        
    }()
    
    lazy var answerChoiceATextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Times New Roman", size: 14)
        tf.backgroundColor = .white
        return tf
        
    }()
    
    lazy var answerChoiceBTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Times New Roman", size: 14)
        tf.backgroundColor = .white
        return tf
        
    }()
    
    lazy var answerChoiceCTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Times New Roman", size: 14)
        tf.backgroundColor = .white
        return tf
        
    }()
    
    lazy var answerChoiceDTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Times New Roman", size: 14)
        tf.backgroundColor = .white
        return tf
        
    }()
    
    lazy var userLivesImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()

    
    lazy var skipButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()
        view.backgroundColor = .blue
    }

    private func addViews(){
        view.addSubview(questionTextField)
        view.addSubview(answerChoiceATextField)
        view.addSubview(answerChoiceBTextField)
        view.addSubview(answerChoiceCTextField)
        view.addSubview(answerChoiceDTextField)
        view.addSubview(skipButton)
        view.addSubview(backButton)
        
    }
    
    private func addConstraints(){
        setUpQuestionTF()
        setUpAnswersStackView()
        
    }
    
    private func setUpQuestionTF(){
        questionTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            questionTextField.heightAnchor.constraint(equalToConstant: 100),
            questionTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),

            questionTextField.bottomAnchor.constraint(equalTo: answerChoiceATextField.topAnchor, constant: 50),

        ])
        
    }
    
    private func setUpAnswersStackView(){
        let stackView = UIStackView(arrangedSubviews: [answerChoiceATextField, answerChoiceBTextField, answerChoiceCTextField, answerChoiceDTextField])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 130)])
    }
    

}


