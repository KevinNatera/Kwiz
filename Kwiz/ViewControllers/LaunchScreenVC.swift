//
//  LaunchScreenVC.swift
//  Kwiz
//
//  Created by Kevin Natera on 1/27/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class LaunchScreenVC: UIViewController {
    
    lazy var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = UIView.ContentMode.scaleAspectFit
        image.autoresizingMask = [UIView.AutoresizingMask.flexibleBottomMargin, UIView.AutoresizingMask.flexibleHeight, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleWidth]
        image.image = UIImage(named: "logo")
        return image
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
        
        return button
    }()
    
    @objc func authenticate(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7802590728, green: 0.932610333, blue: 0.9999867082, alpha: 1)
        imageConstraint()
        button.addTarget(self, action: #selector(segueToMain), for: .touchUpInside)
        
    }
    
    func imageConstraint(){
        button.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }
    @objc func segueToMain() {
        let destination = MainVC()
        destination.modalPresentationStyle = .fullScreen
        self.present(destination, animated: true, completion: nil)
    }
    
}

