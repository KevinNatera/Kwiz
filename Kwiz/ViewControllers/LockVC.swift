//
//  LockVC.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/4/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class LockVC: UIViewController {

    //MARK: - Objects
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 40)
        return label
    }()
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username:"
        label.font = UIFont(name: "ArialMT", size: 25)
        return label
    }()
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        label.font = UIFont(name: "ArialMT", size: 25)
        return label
    }()
    
    //MARK: - Constraints
    private func setupConstraints() {
        constrainLoginLabel()
        constrainUsernameLabel()
        contrainPasswordLabel()
    }
    private func constrainLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    private func constrainUsernameLabel() {
        view.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            usernameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)])
    }
    private func contrainPasswordLabel() {
        view.addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 25),
            passwordLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor)])
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8754208684, green: 0.3353283703, blue: 0.1785621047, alpha: 1)
        setupConstraints()

    }

}
