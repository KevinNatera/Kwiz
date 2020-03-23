//
//  MovingImageVC.swift
//  Kwiz
//
//  Created by EricM on 3/10/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import CoreMotion
import SpriteKit
import UIKit
import GameplayKit

class MovingImageVC: UIViewController {
    
    let motionManager = CMMotionManager()
    var scene = GameScene()
    let place: ButtonStatus? = nil
    var game = Game.shared
    var segueFuncAlreadyRan = false
    
    //MARK: Lazy vars
    lazy var instructions: UILabel = {
        let text = UILabel()
        text.text = "Tilt and Find the Correct Door to Exit!"
        text.numberOfLines = 3
        text.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        text.alpha = 0
        return text
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 5
        button.setBackgroundImage(UIImage(named: "KH3"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector (nextVC), for: .touchUpInside)
        
        return button
    }()
    
    lazy var falseButton1: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.isHidden = true
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 5
        button.imageView?.contentMode = .scaleToFill
        let btnImage = UIImage(named: "monsterInc")
        button.setImage(btnImage , for: .normal)
        button.addTarget(self, action: #selector (wrongAnswer), for: .touchUpInside)
        
        return button
    }()
    
    lazy var falseButton2: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.isHidden = true
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 5
        button.imageView?.contentMode = .scaleToFill
        let btnImage = UIImage(named: "narnia")
        button.setImage(btnImage , for: .normal)
        button.addTarget(self, action: #selector (wrongAnswer), for: .touchUpInside)
        
        return button
    }()
    
    var heartStack = HeartsStackView(livesRemaining: Game.shared.getLives())
    
    @objc func nextVC(){
        answerResult(userResult: .correct, viewController: self)
        
    }
    @objc func wrongAnswer(){
        answerResult(userResult: .wrong, viewController: self)
    }
    
    private func segue(funcAlreadyCalled: Bool) {
        if !funcAlreadyCalled {
        Game.shared.increaseScoreForSpecialQuestions()
        Game.shared.switchAndGetNextTypeOfQuestion()
        let vc = useNextTypeToCallVC(nextType: Game.shared.getNextType())
        navigationController?.pushViewController(vc, animated: true)
            segueFuncAlreadyRan = true
        }
    }
    private func loseLivesInLockVC() {
        Game.shared.reduceLives()
        heartStack.loseLife(remaining: Game.shared.getLives())
    }
    
    private func answerResult(userResult:UserResult, viewController: UIViewController){
        
        switch userResult {
        case .correct:
            let alert = UIAlertController(title: "Correct!", message: "Congratulations! You gained \(Game.shared.getCurrentSpecialQuestion()?.points ?? 5) points!", preferredStyle: .alert)
            viewController.present(alert, animated: true)
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when) {
                alert.dismiss(animated: true, completion: { [weak self] in
                    Game.shared.updatesGameCenter()
                    self?.segue(funcAlreadyCalled: self?.segueFuncAlreadyRan ?? false)})
            }
            
            
        case .wrong:
            let alert = UIAlertController(title: "Wrong", message: "Try again!", preferredStyle: .alert)
            let when = DispatchTime.now() + 1
            DispatchQueue.main.asyncAfter(deadline: when){
                alert.dismiss(animated: true, completion: { [weak self] in
                    self?.loseLivesInLockVC()})
            }
            viewController.present(alert, animated: true)
        }
    }
    
    //MARK: Constraints
    private func setUpLivesStackView(){
        heartStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heartStack)
        NSLayoutConstraint.activate([
            heartStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            heartStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            heartStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            heartStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    func setupConstraints(){
        instructions.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        falseButton1.translatesAutoresizingMaskIntoConstraints = false
        falseButton2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instructions)
        view.addSubview(button)
        view.addSubview(falseButton1)
        view.addSubview(falseButton2)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            instructions.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructions.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            falseButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            falseButton1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            falseButton1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            falseButton1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
        
            falseButton2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            falseButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            falseButton2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            falseButton2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
        ])
    }
    
    
    //MARK:Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        presentScene()
        setupConstraints()
        setUpLivesStackView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startingAnimation()
    }
    
    //MARK: - Private Funcs
    
    /// Sets up spritekit scene as the uiviewcontrller view
    private func presentScene() {
        scene = GameScene(size: view.frame.size)
        self.view = SKView(frame: view.frame)
        let skView = view as! SKView
        skView.showsNodeCount = true
        skView.showsFPS = true
        skView.showsPhysics = false
        scene.buttonDelegate = self
        scene.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        skView.presentScene(scene)
    }
    
    
    /// Starts Animation for showing question/Instructions
    private func startingAnimation(){
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: [.calculationModePaced], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                self.instructions.alpha = 1
                self.instructions.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 1, animations: {
                self.instructions.alpha = 0
            })
        }) { (Bool) in
        }
    }
   
    
    
}



//MARK: Extension
extension MovingImageVC: ButtonStatus {
    func delegate(onOrOff: Bool) {
        self.button.isHidden = onOrOff
    }
    func delegate1(onOrOff1: Bool) {
        self.falseButton1.isHidden = onOrOff1
    }
    func delegate2(onOrOff2: Bool) {
        self.falseButton2.isHidden = onOrOff2
    }
}
