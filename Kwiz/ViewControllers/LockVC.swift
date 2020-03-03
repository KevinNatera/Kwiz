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
    let lockImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lock")
        image.contentMode = .scaleAspectFit
        return image
    }()
    let textBox: UIView = {
        let boxView = UIView()
        boxView.backgroundColor = #colorLiteral(red: 0.8467330933, green: 0.8713539243, blue: 0.8751690984, alpha: 1)
        return boxView
    }()
    let textBox2: UIView = {
        let boxView = UIView()
        boxView.backgroundColor = #colorLiteral(red: 0.8467330933, green: 0.8713539243, blue: 0.8751690984, alpha: 1)
        return boxView
    }()
    let handle: UIView = {
        let knob = UIView(frame: .zero)
        knob.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        knob.layer.borderColor = UIColor.black.cgColor
        knob.layer.borderWidth = 10
        knob.layer.cornerRadius = 30
        return knob
    }()
    let heartStack = HeartsStackView()
    
    var segueFuncAlreadyRan = false
    //MARK: Gestures
    let panGesture = UIPanGestureRecognizer()
    let usernameGesture = UITapGestureRecognizer()
    let passwordGesture = UITapGestureRecognizer()
    let signInGesture = UITapGestureRecognizer()
    
    //MARK: - Constraints
    private func setupConstraints() {
        constrainLoginLabel()
        constrainUsernameLabel()
        contrainPasswordLabel()
        constrainSignUpLabel()
        constrainLockView()
        constrainLockImage()
        constrainTextBox()
        constrainTextBox2()
        constrainHandle()
        constrainHeartStack()
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
    private func constrainLockImage() {
        lockView.addSubview(lockImage)
        lockImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lockImage.leadingAnchor.constraint(equalTo: lockView.leadingAnchor, constant: 30),
            lockImage.trailingAnchor.constraint(equalTo: lockView.trailingAnchor, constant: -30),
            lockImage.bottomAnchor.constraint(equalTo: lockView.bottomAnchor, constant: -50),
            lockImage.topAnchor.constraint(equalTo: lockView.centerYAnchor, constant: 50)])
    }
    private func constrainTextBox() {
        view.addSubview(textBox)
        textBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textBox.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 20),
            textBox.topAnchor.constraint(equalTo: usernameLabel.topAnchor, constant: -5),
            textBox.bottomAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            textBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)])
    }
    private func constrainTextBox2() {
        view.addSubview(textBox2)
        textBox2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textBox2.leadingAnchor.constraint(equalTo: textBox.leadingAnchor),
            textBox2.topAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -5),
            textBox2.bottomAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            textBox2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)])
    }
    private func constrainHandle() {
        view.addSubview(handle)
        handle.translatesAutoresizingMaskIntoConstraints = false
        handle.layer.anchorPoint = CGPoint(x: 0.1, y: 0.5)
        NSLayoutConstraint.activate([
            handle.widthAnchor.constraint(equalToConstant: 200),
            handle.heightAnchor.constraint(equalToConstant: 60),
            handle.leadingAnchor.constraint(equalTo: lockView.centerXAnchor, constant: -20 - 85),
            handle.topAnchor.constraint(equalTo: lockView.topAnchor, constant: 60)])
    }
    private func constrainHeartStack() {
        view.addSubview(heartStack)
        heartStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            heartStack.widthAnchor.constraint(equalToConstant: 150),
            heartStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            heartStack.heightAnchor.constraint(equalToConstant: 60)])
        //heartStack.isHidden = true
    }
    
    //MARK: Methods
    @objc func draggedView(sender: UIPanGestureRecognizer) {
        guard let view = sender.view else { return }
        let touch = sender.location(in: view.superview)
        let origin = view.layer.position
        let point = CGPoint(x: touch.x - origin.x, y: touch.y - origin.y)
        print(point.x)
        guard point.y > 0, point.x > 0 else {
            if point.x <= 0 {
                segue(funcAlreadyCalled: segueFuncAlreadyRan)
                return
            }
            return
        }
        
        let angle = point.x == 0 ? .pi/2 : atan(Double(point.y / point.x))
        //print(touch)
        //print(angle)
        handle.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
    }
    func segue(funcAlreadyCalled: Bool) {
        if !funcAlreadyCalled {
        Game.shared.increaseScoreForSpecialQuestions()
        Game.shared.switchAndGetNextTypeOfQuestion()
        let vc = useNextTypeToCallVC(nextType: Game.shared.getNextType())
        navigationController?.pushViewController(vc, animated: true)
            segueFuncAlreadyRan = true
        }
    }
    @objc private func tappedUsernameBox() {
        print("tapped username box")
    }
    @objc private func tappedPasswordBox() {
        print("tapped password box")
    }
    @objc private func tappedSignIn() {
        print("tapped sign in")
    }
    
    //MARK: Gesture Functions
    private func addGestures() {
        addPanGestureToHandle()
        addTapGestureToUsernameBox()
        addTapGestureToPasswordBox()
        addTapGestureToSignIn()
    }
    private func addPanGestureToHandle() {
        panGesture.addTarget(self, action: #selector(draggedView))
        handle.addGestureRecognizer(panGesture)
    }
    private func addTapGestureToUsernameBox() {
        usernameGesture.addTarget(self, action: #selector(tappedUsernameBox))
        textBox.addGestureRecognizer(usernameGesture)
    }
    private func addTapGestureToPasswordBox() {
        passwordGesture.addTarget(self, action: #selector(tappedPasswordBox))
        textBox2.addGestureRecognizer(passwordGesture)
    }
    private func addTapGestureToSignIn() {
        signUpLabel.isUserInteractionEnabled = true
        signInGesture.addTarget(self, action: #selector(tappedSignIn))
        signUpLabel.addGestureRecognizer(signInGesture)
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = #colorLiteral(red: 0.8754208684, green: 0.3353283703, blue: 0.1785621047, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        setupConstraints()
        addGestures()

    }

}
