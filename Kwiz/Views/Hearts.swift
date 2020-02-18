//
//  Hearts.swift
//  Kwiz
//
//  Created by Kevin Natera on 2/18/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class HeartsStackView: UIStackView {
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Setup Functions
    func setupStackView() {
        axis = .horizontal
        spacing = 1
        distribution = .fillEqually
    }
}
