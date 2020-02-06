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
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up for an account!"
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        return label
    }()
    let lockView: UIView = {
        let lockView = UIView(frame: CGRect(x: 0, y: 0, width: 124, height: 300))
        lockView.layer.borderColor = UIColor.black.cgColor
        lockView.layer.borderWidth = 15
        lockView.layer.cornerRadius = lockView.frame.width / 2
        return lockView
    }()
    
    //MARK: - Constraints
    private func setupConstraints() {
        constrainLoginLabel()
        constrainUsernameLabel()
        contrainPasswordLabel()
        constrainSignUpLabel()
        constrainLockView()
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
            usernameLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 70),
            usernameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50)])
    }
    private func contrainPasswordLabel() {
        view.addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 25),
            passwordLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor)])
    }
    private func constrainSignUpLabel() {
        view.addSubview(signUpLabel)
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    private func constrainLockView() {
        view.addSubview(lockView)
        lockView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lockView.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor, constant: -70),
            lockView.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -50),
            lockView.widthAnchor.constraint(equalToConstant: lockView.frame.width),
            lockView.heightAnchor.constraint(equalToConstant: lockView.frame.height)])
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8754208684, green: 0.3353283703, blue: 0.1785621047, alpha: 1)
        setupConstraints()

    }

}
