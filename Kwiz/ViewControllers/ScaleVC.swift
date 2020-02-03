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
    
    //MARK: - Constraints
    private func setConstraints() {
        constrainLine()
        rotateLine()
        constrainPrompt()
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

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        
    }
    

    

}
