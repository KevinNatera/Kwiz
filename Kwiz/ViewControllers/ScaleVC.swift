//
//  ScaleVC.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/3/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class ScaleVC: UIViewController {
    //MARK: - UIObjects
    var line: UIView = {
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: 360, height: 25))
        lineView.backgroundColor = .black
        return lineView
    }()
    var promptLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance the scale"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Times New Roman", size: 40)
        return label
    }()
    var steel: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        image.backgroundColor = .gray
        return image
    }()
    
    //MARK: - Properties
    var steelPanGesture = UIPanGestureRecognizer()
    
    //MARK: - Constraints
    private func setConstraints() {
        constrainLine()
        rotateLine()
        constrainPrompt()
        constrainSteel()
    }
    private func constrainLine() {
        view.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            line.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.widthAnchor.constraint(equalToConstant: line.frame.width),
            line.heightAnchor.constraint(equalToConstant: line.frame.height)])
    }
    private func rotateLine() {
        UIView.animate(withDuration: 0, delay: 0, options: [], animations: {
            self.line.transform = CGAffineTransform(rotationAngle: CGFloat.pi/9)
        }, completion: nil)
    }
    private func constrainPrompt() {
        view.addSubview(promptLabel)
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            promptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            promptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    private func constrainSteel() {
        view.addSubview(steel)
        steel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            steel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            steel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            steel.widthAnchor.constraint(equalToConstant: steel.frame.width),
            steel.heightAnchor.constraint(equalToConstant: steel.frame.height)])
    }
    //MARK: Setup
    private func addGestures() {
        steel.isUserInteractionEnabled = true
        steelPanGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedSteel(_:)))
        steel.addGestureRecognizer(steelPanGesture)
    }
    
    //MARK: - Functions
    
    
    
    //MARK: Objc Func
    @objc func draggedSteel(_ sender: UIPanGestureRecognizer) {
        view.bringSubviewToFront(steel)
        let translation = sender.translation(in: view)
        steel.center = CGPoint(x: steel.center.x + translation.x, y: steel.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        addGestures()
        
    }
    

    

}
