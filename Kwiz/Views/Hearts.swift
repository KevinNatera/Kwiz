//
//  Hearts.swift
//  Kwiz
//
//  Created by Kevin Natera on 2/18/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class HeartsStackView: UIStackView {
    //MARK: Objects
    private var userLivesImageOne: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
        return imageView
    }()
    private var userLivesImageTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
        return imageView
    }()
    private var userLivesImageThree: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
        return imageView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        addHeartsToSubView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    convenience init(
    
    //MARK: Setup Functions
    private func setupStackView() {
        axis = .horizontal
        spacing = 1
        distribution = .fillEqually
    }
    private func addHeartsToSubView() {
        addArrangedSubview(userLivesImageOne)
        addArrangedSubview(userLivesImageTwo)
        addArrangedSubview(userLivesImageThree)
    }
    
    //MARK: Methods
    private func makeLivesVisible() {
        userLivesImageOne.alpha = 1
        userLivesImageTwo.alpha = 1
        userLivesImageThree.alpha = 1
    }
    func loseLife(remaining: LivesRemaining) {
        switch remaining {
        case .three:
            makeLivesVisible()
        case .two:
            userLivesImageOne.alpha = 0
        case .one:
            userLivesImageTwo.alpha = 0
        case .none:
            userLivesImageThree.alpha = 0
        }
    }
    
}
