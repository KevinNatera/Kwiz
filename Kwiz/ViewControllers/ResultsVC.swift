//
//  ResultsVC.swift
//  Kwiz
//
//  Created by Kevin Natera on 2/18/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit
import Lottie


class ResultsVC: UIViewController {
    
    //MARK: - Properties
    
    lazy var confetti: AnimationView = {
        let view = AnimationView(name: "3427-ribbon")
        view.contentMode = .scaleToFill
        view.respectAnimationFrameRate = false
        view.animationSpeed = 1.0
        view.frame = CGRect(x: self.view.center.x - 200, y: 50, width: 400, height: 900)
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var fireWorks: AnimationView = {
           let view = AnimationView(name: "3427-ribbon")
           view.contentMode = .scaleToFill
           view.respectAnimationFrameRate = false
           view.animationSpeed = 1.0
           view.frame = CGRect(x: self.view.center.x - 200, y: 50, width: 400, height: 900)
           view.isUserInteractionEnabled = false
           return view
       }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: view.center.x - 200, y: 100, width: 400, height: 80)
        label.backgroundColor = #colorLiteral(red: 0.7813532948, green: 0.9324833751, blue: 0.9999832511, alpha: 1)
        label.text = "SCORE"
        label.font = UIFont(name: "Verdana-Bold", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: view.center.x - 200, y: 200, width: 400, height: 80)
        label.backgroundColor = #colorLiteral(red: 0.7813532948, green: 0.9324833751, blue: 0.9999832511, alpha: 1)
        label.text = "> 9000!!!"
        label.font = UIFont(name: "Verdana-Bold", size: 50)
        label.textAlignment = .center
        return label
    }()
    
    lazy var retryButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.center.x - 100, y: 650, width: 200, height: 50)
        button.setTitle("Retry", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.backgroundColor = #colorLiteral(red: 0.4573904276, green: 0.8313733935, blue: 0.2300189435, alpha: 1)
        button.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var homeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.center.x - 100, y: 750, width: 200, height: 50)
        button.setTitle("Home", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.backgroundColor = #colorLiteral(red: 0.9645542502, green: 0.1859400272, blue: 0.1500017643, alpha: 1)
        button.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3806488216, green: 0.5188760161, blue: 0.915720582, alpha: 1)
        addSubViews()
        startAnimation()
        setScore()
    }
    
    
    
    //MARK: - Private Methods
    
    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(scoreLabel)
        view.addSubview(retryButton)
        view.addSubview(homeButton)
        view.addSubview(confetti)
    }
    
    private func startAnimation(){
        confetti.play()
    }
    private func setScore() {
        scoreLabel.text = "\(Game.shared.getCurrentScore())!!!"
    }

    
    
    //MARK: - Obj Methods
    
    @objc func retryButtonPressed() {
        let multipleChoice = MultipleChoiceVC()
        
        let navigationController = UINavigationController(rootViewController: multipleChoice)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.isHidden = true
        Game.shared.start()
       
        Game.shared.shuffle()
        Game.shared.getNewCurrentQuestion()
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {return}
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                window.rootViewController = navigationController
        }, completion: nil)
    }
    
    @objc func homeButtonPressed() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {return}
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                window.rootViewController = MainVC()
        }, completion: nil)
    }
    
}
