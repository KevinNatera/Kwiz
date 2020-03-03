//
//  MainVC.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 1/30/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit
import GameKit

class MainVC: UIViewController {
    
    //MARK: - UIObjects
    var startButton = UIButton()
    
    lazy var rankingButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(leaderboard), for: .touchUpInside)
        return button
    }()
    
    var settingButton = UIButton()
    var kwizImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "logo_transparent")
        return view
    }()
    
    
    
    //MARK: - Setup
    private func setupStackViewWithButtons() {
        let stackView = UIStackView(arrangedSubviews: [startButton,rankingButton])
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)])
    }
    private func setupButtons() {
        updateTitleOnButton(button: startButton, title: "START")
        updateTitleOnButton(button: rankingButton, title: "RANKING")
        //updateTitleOnButton(button: settingButton, title: "SETTINGS")
        
        startButton.addTarget(self, action: #selector(segueToQuestion), for: .touchUpInside)
    }
    private func setupImageConstraints() {
        view.addSubview(kwizImage)
        kwizImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kwizImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            kwizImage.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant:  -100),
            kwizImage.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            kwizImage.heightAnchor.constraint(equalToConstant: 200)])
        
    }
    
    //MARK: - Functions
    private func updateTitleOnButton(button: UIButton, title: String) {
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.07879226655, green: 0.173327148, blue: 0.501418829, alpha: 1)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 30)
        button.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        
        button.frame = CGRect(x: 0, y: 0, width: view.frame.size.width * 4 / 5, height: view.frame.size.height / 8)
        
        button.layer.cornerRadius = button.frame.size.height / 2 - 15
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
    }
    
    
        
    
    
    
    
    //MARK: Objc Function
    @objc func segueToQuestion() {
        
        // 1. Instantiate navigation controller
        // 2. Instantiate firstVC
        // 3. Set nav controller as rootVC
        // 4. Push the first VC
        
        
        let multipleChoice = MultipleChoiceVC()
        
        let navigationController = UINavigationController(rootViewController: multipleChoice)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.isHidden = true
        Game.shared.start()
        Game.shared.setUser(user: User(highestScore: 0, nickname: "Bob"))
        Game.shared.getNewCurrentQuestion()
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {return}
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                window.rootViewController = navigationController
        }, completion: nil)
        
        
    }
    
    @objc func leaderboard() {
        let vc = GKGameCenterViewController()
        vc.gameCenterDelegate = self
        vc.viewState = .leaderboards
        vc.leaderboardIdentifier = "kwiz.leaderboard.highscore"
        present(vc, animated: true, completion: nil)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3904388547, green: 0.4836898446, blue: 1, alpha: 1)
        setupButtons()
        setupStackViewWithButtons()
        setupImageConstraints()
        GameCenterHelper.helper.viewController = self
        GKAchievement.resetAchievements(completionHandler: nil)
    }
    
}

extension MainVC: GKGameCenterControllerDelegate {
  func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
    gameCenterViewController.dismiss(animated: true, completion: nil)
  }
}
