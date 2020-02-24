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
        view.image = UIImage(named: "logo")
        return view
    }()
    
    
    
    //MARK: - Setup
    private func setupStackViewWithButtons() {
        let stackView = UIStackView(arrangedSubviews: [startButton,rankingButton])
        stackView.axis = .vertical
        stackView.spacing = view.frame.size.height / 9
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height / 3 + 30)])
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
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6798086851, green: 0.9229053351, blue: 0.9803921569, alpha: 1)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 40)
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
        Game.shared.shuffle()
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
        view.backgroundColor = #colorLiteral(red: 0.4241105914, green: 0.3439905345, blue: 0.7182968259, alpha: 1)
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
