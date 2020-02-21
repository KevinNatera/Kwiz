//
//  GameCenterHelper.swift
//  Kwiz
//
//  Created by EricM on 2/10/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import Foundation
import GameKit

final class GameCenterHelper: NSObject {
  typealias CompletionBlock = (Error?) -> Void
    
  static let helper = GameCenterHelper()
  
  static var isAuthenticated: Bool {
    return GKLocalPlayer.local.isAuthenticated
  }

var viewController: UIViewController?
    
    override init() {
      super.init()
      
      GKLocalPlayer.local.authenticateHandler = { gcAuthVC, error in
        
        
        
        if GKLocalPlayer.local.isAuthenticated {
          print("Authenticated to Game Center!")
        } else if let vc = gcAuthVC {
          self.viewController?.present(vc, animated: true)
        }
        else {
          print("Error authentication to GameCenter: " +
            "\(error?.localizedDescription ?? "none")")
        }
      }
    }
    
    
    /// this function takes in an Int for the score and sends it to Game Center
    /// - Parameter score: sends the user score up to gamecenter
//    static func pushScoreToGC(score:Int){
//        if GKLocalPlayer.local.isAuthenticated {
//            let scoreResponse = GKScore(leaderboardIdentifier: "kwiz.leaderboard.highscore")
//            scoreResponse.value = Int64(score)
//            let scoreArr: [GKScore] = [scoreResponse]
//            GKScore.report(scoreArr, withCompletionHandler: nil)
//        }
//
//    }
    
    
    /// Checks to see if the user completed the required score for the achievement and then uploads it to Game Center
    /// - Parameter userScore: reads the user current score(Int) while in game
//    static func checkFinishAchievement(userScore: Int){
//        if(userScore >= 5) {
//            let achieved = GKAchievement(identifier: "kwiz.achievement.finished", player: GKLocalPlayer.local)
//            achieved.percentComplete = 100
//            achieved.showsCompletionBanner = true
//            //GKAchievement.resetAchievements(completionHandler: nil)
//            let achievementArr: [GKAchievement] = [achieved]
//            GKAchievement.report(achievementArr, withCompletionHandler: nil)
//        }
//    }
    
}

extension Notification.Name {
//  static let presentGame = Notification.Name(rawValue: "presentGame")
  static let authenticationChanged = Notification.Name(rawValue: "authenticationChanged")
}

extension GKLeaderboard {}
