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
    
    
    
    
    
    //MARK: - Private Methods
    private func addSubviews() {
        view.backgroundColor = #colorLiteral(red: 0.4326986074, green: 0.5668497086, blue: 1, alpha: 1)
        view.addSubview(titleLabel)
       
    }
    
   
    
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        
    }
    
    
    
        
    
}




