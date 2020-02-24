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
        label.backgroundColor = .blue
        label.text = "RESULTS"
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: view.center.x - 200, y: 200, width: 400, height: 80)
        label.backgroundColor = .blue
        label.text = "> 9000!!!"
        label.font = label.font.withSize(50)
        label.textAlignment = .center
        return label
    }()
    
    lazy var retryButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.center.x - 100, y: 650, width: 200, height: 50)
        button.setTitle("Retry", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var homeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.center.x - 100, y: 750, width: 200, height: 50)
        button.setTitle("Home", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {return}
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                window.rootViewController = navigationController
        }, completion: nil)
    }
    
    @objc func homeButtonPressed() {
        Game.shared.quit()
    }
    
}
