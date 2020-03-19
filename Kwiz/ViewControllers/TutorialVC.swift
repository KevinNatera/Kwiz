//
//  InstructionsVC.swift
//  Kwiz
//
//  Created by Kevin Natera on 3/17/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController {
    
    //MARK: - Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString.init(string: "How to play")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        label.attributedText = attributedString
        label.frame = CGRect(x: view.center.x - 150, y: 100, width: 300, height: 70)
        label.textAlignment = .center
        label.font = label.font.withSize(60)
        label.alpha = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: view.center.x - 200, y: 225, width: 400, height: 475)
        label.text = "Hey there! This is an interactive quiz game designed to challenge you to think outside the box, so not every question should be taken literally! If the obvious approach doesn't work, try something completely outlandish! What can be interacted with isn't always straightforward, so try pinching, dragging, and messing with everything!"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 20
        label.alpha = 0
        return label
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: view.center.x - 100, y: 750, width: 200, height: 75)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.setTitle("Let's go!", for: .normal)
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    
    @objc func startButtonPressed() {
        //segue to multiplechoiceVC
    }
    
    lazy var whiteScreen: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        view.backgroundColor = .white
        view.layer.zPosition = 1
        return view
    }()
    
    
    //MARK: - Private Methods
    private func addSubviews() {
        view.backgroundColor = #colorLiteral(red: 0.4326986074, green: 0.5668497086, blue: 1, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(startButton)
        view.addSubview(whiteScreen)
    }
    
    private func fadeInViews() {
        UIView.animate(withDuration: 1) {
            self.whiteScreen.alpha = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)  {
            UIView.animate(withDuration: 2) {
                self.titleLabel.alpha = 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 4) {
                self.descriptionLabel.alpha = 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            UIView.animate(withDuration: 4) {
                self.startButton.alpha = 1
            }
        }
    }
    
    
    
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        fadeInViews()
    }
    
    
}




