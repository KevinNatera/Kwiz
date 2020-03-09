//
//  PreAdvertiseVC.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 3/9/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit
protocol Advertisable {
    func segue()
}

class PreAdvertiseVC: MultipleChoiceVC {
    var darkView = UIView()
    
    //MARK: - Constraints
    private func addViews(){
        view.addSubview(questionTextField)
        view.addSubview(answerChoiceAButton)
        view.addSubview(answerChoiceBButton)
        view.addSubview(answerChoiceCButton)
        view.addSubview(answerChoiceDButton)
        heartStack = HeartsStackView(livesRemaining: Game.shared.getLives())
        view.addSubview(heartStack)
    }
    private func addConstraints(){
        setUpQuestionTF()
        setUpAnswersStackView()
        setUpLivesStackView()
    }
    private func setUpQuestionTF(){
            questionTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                questionTextField.topAnchor.constraint(equalTo: heartStack.bottomAnchor, constant: 10),
                questionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                questionTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                questionTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
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
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: questionTextField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: questionTextField.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 50),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
    private func setUpLivesStackView(){
        
        heartStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heartStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            heartStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            heartStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),

        ])
    }
    func setupDarkView() {
        darkView.alpha = 0.5
        darkView.backgroundColor = .black
        view.addSubview(darkView)
        darkView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkView.topAnchor.constraint(equalTo: view.topAnchor),
            darkView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            darkView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) { [weak self] in
            let ad = AdvertisementVC()
            ad.adDelegate = self
            ad.modalPresentationStyle = .fullScreen
            self?.present(ad, animated: true, completion: nil)
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        addViews()
        addConstraints()
        view.backgroundColor = #colorLiteral(red: 0.4326986074, green: 0.5668497086, blue: 1, alpha: 1)
        
        questionTextField.text = "Shinx of black quartz judge my vow"
        let answers: [String] = ["Holy Sh!t","So metal","Raw as hell"].shuffled()
        answerChoiceAButton.setTitle("\(answers[0])", for: .normal)
        answerChoiceBButton.setTitle("\(answers[1])", for: .normal)
        answerChoiceCButton.setTitle("\(answers[2])", for: .normal)
        answerChoiceDButton.setTitle("All of the above", for: .normal)
        
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) { [weak self] in
            self?.setupDarkView()
        }
    }
}

extension PreAdvertiseVC: Advertisable {
    func segue() {
        Game.shared.increaseScoreForSpecialQuestions()
        Game.shared.switchAndGetNextTypeOfQuestion()
        let vc = useNextTypeToCallVC(nextType: Game.shared.getNextType())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

//MARK: TODO fix constraints from MultipleChoice vc
