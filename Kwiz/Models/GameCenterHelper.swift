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
        
//        switch GKLocalPlayer.local.isAuthenticated {
//        case true:
//             print("Authenticated to Game Center!")
//        case false:
//           let vc = gcAuthVC
//           viewController?.present(vc, animated: true)
//
//        }
      }
    }
    
}

extension Notification.Name {
//  static let presentGame = Notification.Name(rawValue: "presentGame")
  static let authenticationChanged = Notification.Name(rawValue: "authenticationChanged")
}

extension GKLeaderboard {}
