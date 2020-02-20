//
//  ViewController.swift
//  Kwiz
//
//  Created by Kevin Natera on 1/27/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class MultipleChoiceVC: UIViewController {
    //MARK: - Properties
    let user = User(highestScore: 0, nickname: "Bob")
    
    
    //MARK: - UI Objects
    lazy var questionTextField: UILabel = {
        let tf = UILabel()
        tf.font = UIFont(name: "Times New Roman", size: 22)
        tf.backgroundColor = #colorLiteral(red: 0.6353338957, green: 0.7361501455, blue: 1, alpha: 1)
        tf.textAlignment = .center
        tf.numberOfLines = 3
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        return tf
        
    }()
    
    lazy var answerChoiceAButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6353338957, green: 0.7361501455, blue: 1, alpha: 1)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Regular", size: 20)
        button.tag = 0
        return button
        
    }()
    
    lazy var answerChoiceBButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6353338957, green: 0.7361501455, blue: 1, alpha: 1)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Regular", size: 20)
        button.tag = 1
        return button
        
    }()
    
    lazy var answerChoiceCButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6353338957, green: 0.7361501455, blue: 1, alpha: 1)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Regular", size: 20)
        button.tag = 2
        return button
        
    }()
    
    lazy var answerChoiceDButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6353338957, green: 0.7361501455, blue: 1, alpha: 1)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Regular", size: 20)
        button.tag = 3
        return button
        
    }()
    
    
    lazy var skipButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.setImage(UIImage(named: "forwardArrow"), for: .normal)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.addTarget(self, action: #selector(segueToQuestion), for: .touchUpInside)
        return button
    }()
    var heartStack = HeartsStackView(livesRemaining: Game.shared.getLives())
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
    
    lazy var hintButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.setImage(UIImage(named: "hint"), for: .normal)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addConstraints()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        addTargetsToButtons()

        Game.shared.shuffle()
      
        questionTextField.text = Game.shared.getQuestionText()
        let answerTexts = Game.shared.getAnswerTexts()
        answerChoiceAButton.setTitle("\(answerTexts[0])", for: .normal)
        answerChoiceBButton.setTitle("\(answerTexts[1])", for: .normal)
        answerChoiceCButton.setTitle("\(answerTexts[2])", for: .normal)
        answerChoiceDButton.setTitle("\(answerTexts[3])", for: .normal)

    }
    //MARK: - Methods
    private func checkIfNoMoreQuestions() {
        if Game.shared.isQuestionsEmpty() {
            //MARK: TODO: present end alert
        } else {
            goToNextQuestion()
        }
    }
    private func goToNextQuestion() {
        // 1. instatiate another VC
        // 2 . push
        let newMC = MultipleChoiceVC()
        navigationController?.pushViewController(newMC, animated: true)
    }
    private func increaseGameScore() {
        Game.shared.increaseScore()
        Game.shared.saveScore()
        Game.shared.checkFinishAchievement()
    }
    //MARK: - Setup and Constraints
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
        view.addSubview(heartStack)
        view.addSubview(hintButton)
        
    }
    
    private func addConstraints(){
        setUpQuestionTF()
        setUpAnswersStackView()
        setUpBackButton()
        setUpSkipButton()
        setUpLivesStackView()
        setUpHintButton()
        
    }
    
    private func setUpQuestionTF(){
        questionTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            questionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            questionTextField.heightAnchor.constraint(equalToConstant: 100),
            questionTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            
            questionTextField.bottomAnchor.constraint(equalTo: answerChoiceAButton.topAnchor, constant:
                50),
        ])
        
    }
    
    private func setUpAnswersStackView(){
        let stackView = UIStackView(arrangedSubviews: [answerChoiceAButton, answerChoiceBButton, answerChoiceCButton, answerChoiceDButton])
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            stackView.leadingAnchor.constraint(equalTo: questionTextField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: questionTextField.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 75)
        ])
    }
    
    private func setUpBackButton(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            backButton.heightAnchor.constraint(equalToConstant: 70),
            backButton.bottomAnchor.constraint(equalTo: questionTextField.topAnchor, constant: -30),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 55)
            
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
//        let stackView = UIStackView(arrangedSubviews: [userLivesImageOne, userLivesImageTwo, userLivesImageThree])
//        stackView.axis = .horizontal
//        stackView.spacing = 1
//        stackView.distribution = .fillEqually
//        self.view.addSubview(stackView)
        
        heartStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            heartStack.bottomAnchor.constraint(equalTo: questionTextField.topAnchor, constant: -30),
            heartStack.heightAnchor.constraint(equalToConstant: 60),
            heartStack.widthAnchor.constraint(equalToConstant: 150)

        ])
        
        
    }

    
    private func setUpHintButton(){
        hintButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hintButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            hintButton.topAnchor.constraint(equalTo: answerChoiceDButton.bottomAnchor, constant: 15),
            hintButton.heightAnchor.constraint(equalToConstant: 50),
            hintButton.widthAnchor.constraint(equalToConstant: 50)
            
        
        ])
        
        
    }
    

    private func addTargetsToButtons() {
        answerChoiceAButton.addTarget(self, action: #selector(buttonPicked(sender:)), for: .touchUpInside)
        answerChoiceBButton.addTarget(self, action: #selector(buttonPicked(sender:)), for: .touchUpInside)
        answerChoiceCButton.addTarget(self, action: #selector(buttonPicked(sender:)), for: .touchUpInside)
        answerChoiceDButton.addTarget(self, action: #selector(buttonPicked(sender:)), for: .touchUpInside)
    }
    
    //MARK: - Objc Functions
    
    
    @objc private func buttonPicked(sender: UIButton) {
        if Game.shared.answer(sender.tag) {
            print("you're right!")
            increaseGameScore()
            checkIfNoMoreQuestions()
        
        } else {
            heartStack.loseLife(remaining: Game.shared.getLives())
        }
    }
    
    @objc private func segueToQuestion() {
        let vc = MainVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }

    
    
}


