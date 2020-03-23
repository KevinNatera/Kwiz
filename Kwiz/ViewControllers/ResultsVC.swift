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
    
    lazy var winAnimation: AnimationView = {
        let view = AnimationView(name: "3427-ribbon")
        view.contentMode = .scaleToFill
        view.respectAnimationFrameRate = false
        view.animationSpeed = 1.0
        view.frame = CGRect(x: self.view.center.x - 200, y: 50, width: 400, height: 900)
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var loseAnimation: AnimationView = {
           let view = AnimationView(name: "9990-explosion")
           view.contentMode = .scaleToFill
           view.respectAnimationFrameRate = false
           view.animationSpeed = 1.0
           view.frame = CGRect(x: self.view.center.x - 200, y: 50, width: 400, height: 700)
           view.isUserInteractionEnabled = false
        view.alpha = 0
           return view
       }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: view.center.x - 200, y: 100, width: 400, height: 80)
        label.backgroundColor = #colorLiteral(red: 0.4326986074, green: 0.5668497086, blue: 1, alpha: 1)
        label.text = "SCORE"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        label.textAlignment = .center
        label.textColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 2
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: view.center.x - 200, y: 200, width: 400, height: 80)
        label.backgroundColor = #colorLiteral(red: 0.4326986074, green: 0.5668497086, blue: 1, alpha: 1)
        label.text = "> 9000!!!"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 50)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.textColor = .white
        label.layer.cornerRadius = 20
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 2
        
        return label
    }()
    
    lazy var retryButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.center.x - 100, y: 650, width: 200, height: 100)
        button.setTitle("Retry", for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        button.backgroundColor = #colorLiteral(red: 0.4573904276, green: 0.8313733935, blue: 0.2300189435, alpha: 1)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var homeButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.center.x - 100, y: 750, width: 200, height: 100)
        button.setTitle("Home", for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        button.backgroundColor = #colorLiteral(red: 0.9645542502, green: 0.1859400272, blue: 0.1500017643, alpha: 1)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
        return button
    }()
    var resultImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "trophy")
        return image
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.07879226655, green: 0.173327148, blue: 0.501418829, alpha: 1)
        addSubViews()
        addAllConstraints()
        startAnimation()
        setScore()
        print("Lives left: \(Game.shared.getLives())")
    }
    
    //MARK: - Contraints
    private func addAllConstraints() {
        addTitleConstraints()
        addScoreConstraints()
        addRetryConstraints()
        addHomeButtonConstraints()
        addResultImageConstraints()
    }
    private func addTitleConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 80)])
    }
    private func addScoreConstraints() {
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            scoreLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            scoreLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)])
    }
    private func addRetryConstraints() {
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            retryButton.widthAnchor.constraint(equalToConstant: 200),
            retryButton.heightAnchor.constraint(equalToConstant: 75),
            retryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)])
    }
    private func addHomeButtonConstraints() {
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: retryButton.bottomAnchor, constant: 50),
            homeButton.widthAnchor.constraint(equalTo: retryButton.widthAnchor),
            homeButton.heightAnchor.constraint(equalTo: retryButton.heightAnchor),
            homeButton.centerXAnchor.constraint(equalTo: retryButton.centerXAnchor)])
    }
    private func addResultImageConstraints() {
        view.addSubview(resultImage)
        resultImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultImage.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: view.frame.height * 0.05),
            resultImage.bottomAnchor.constraint(equalTo: retryButton.topAnchor, constant: -view.frame.height * 0.05),
            resultImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            resultImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    //MARK: - Private Methods
    
    private func addSubViews() {
        view.addSubview(titleLabel)
        view.addSubview(scoreLabel)
        view.addSubview(retryButton)
        view.addSubview(homeButton)
        view.addSubview(winAnimation)
        view.addSubview(loseAnimation)
        
    }
    
    private func startAnimation(){
        switch Game.shared.getLives() {
        case .none:
            resultImage.image = UIImage(named: "brokenTrophy")
            loseAnimation.alpha = 1
            loseAnimation.play()
        default:
            winAnimation.play()
        }
    
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
