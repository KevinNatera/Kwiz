//
//  MainVC.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 1/30/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: - UIObjects
    var startButton = UIButton()
    var rankingButton = UIButton()
    var settingButton = UIButton()
    var kwizImage: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(named: "Kwiz")
        return view
    }()
    
    //MARK: - Setup
    private func setupStackViewWithButtons() {
        let stackView = UIStackView(arrangedSubviews: [startButton,rankingButton,settingButton])
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
        updateTitleOnButton(button: settingButton, title: "SETTINGS")
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

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4241105914, green: 0.3439905345, blue: 0.7182968259, alpha: 1)
        setupButtons()
        setupStackViewWithButtons()
        setupImageConstraints()

    }

}
