//
//  LoginVC.swift
//  Kwiz
//
//  Created by Kevin Natera on 1/27/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit
import GameKit

class LoginVC: UIViewController {
    
    var score = 0
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Score +1", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(startTheGame), for: .touchUpInside)
        
        return button
    }()
    
    lazy var leaderBoardButton: UIButton = {
        let button = UIButton()
        button.setTitle("Leaderboard", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(leaderboard), for: .touchUpInside)
        
        return button
    }()
    
    lazy var achievementButton: UIButton = {
        let button = UIButton()
        button.setTitle("Achievement", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(achievements), for: .touchUpInside)
        
        return button
    }()
    
    lazy var userPoints: UILabel = {
        let text = UILabel()
        text.text = "Points \(score)"
        text.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return text
    }()
    
    @objc func startTheGame(){
        score += 1
        userPoints.text = "Points: \(score)"
        saveScore(score: score)
       // checkFinishAchievement()
    }
    @objc func leaderboard() {
      let vc = GKGameCenterViewController()
      vc.gameCenterDelegate = self
      vc.viewState = .leaderboards
      vc.leaderboardIdentifier = "kwiz.leaderboard.highscore"
      present(vc, animated: true, completion: nil)
    }
    @objc func achievements() {
      let vc = GKGameCenterViewController()
        vc.viewState = .achievements
      present(vc, animated: true, completion: nil)
    }
    
    func saveScore(score:Int){
        if GKLocalPlayer.local.isAuthenticated {
            let scoreResponse = GKScore(leaderboardIdentifier: "kwiz.leaderboard.highscore")
            scoreResponse.value = Int64(score)
            let scoreArr: [GKScore] = [scoreResponse]
            GKScore.report(scoreArr, withCompletionHandler: nil)
        }
        
    }
    
    func checkFinishAchievement(){
        if(score >= 20) {
            let achieved = GKAchievement(identifier: "kwiz.achievement.finished", player: GKLocalPlayer.local)
            //GKAchievement.resetAchievements(completionHandler: nil)
            let achievementArr: [GKAchievement] = [achieved]

            GKAchievement.report(achievementArr, withCompletionHandler: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        setupConstraints()
        GameCenterHelper.helper.viewController = self
        
    }
    
    
    
    
    func setupConstraints (){
        startButton.translatesAutoresizingMaskIntoConstraints = false
        leaderBoardButton.translatesAutoresizingMaskIntoConstraints = false
        achievementButton.translatesAutoresizingMaskIntoConstraints = false
        userPoints.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userPoints)
        view.addSubview(startButton)
        view.addSubview(leaderBoardButton)
        view.addSubview(achievementButton)
        
        NSLayoutConstraint.activate([
            
            userPoints.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            userPoints.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPoints.widthAnchor.constraint(equalToConstant: 150),
            userPoints.heightAnchor.constraint(equalToConstant: 50),
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            
            leaderBoardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            leaderBoardButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10),
            leaderBoardButton.heightAnchor.constraint(equalToConstant: 50),
            leaderBoardButton.widthAnchor.constraint(equalToConstant: 150),
            
            achievementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            achievementButton.topAnchor.constraint(equalTo: leaderBoardButton.bottomAnchor, constant: 10),
            achievementButton.heightAnchor.constraint(equalToConstant: 50),
            achievementButton.widthAnchor.constraint(equalToConstant: 150)
            
        ])
        
    }
    
}

extension LoginVC: GKGameCenterControllerDelegate {
  func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
    gameCenterViewController.dismiss(animated: true, completion: nil)
  }
}
