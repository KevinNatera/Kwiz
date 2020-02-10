//
//  AdvertisementVC.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/10/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

class AdvertisementVC: UIViewController {
    //MARK: - Objects
    var adLabel: UILabel = {
        let label = UILabel()
        label.text = "You exercised your mind for a while now,\n\nHow about exercising your body?"
        label.numberOfLines = 5
        label.font = UIFont(name: "Avenir-BlackOblique", size: 25)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return label
    }()
    var groupOneLabel: UILabel = {
        let label = UILabel()
        label.text = "💪Prepare to get Rock Hard!!\n\n This app will help you build or join a community at your local gym,\nfind workouts to suit your needs and more!"
        label.textAlignment = .center
        label.numberOfLines = 15
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        return label
    }()
    var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download Today!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 5
        button.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        return button
    }()
    
    //MARK: - Setup/ Constraints
    private func setupConstraints() {
        constrainAdLabel()
        constrainGroupOneLabel()
    }
    private func constrainAdLabel() {
        view.addSubview(adLabel)
        adLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            adLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            adLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            adLabel.heightAnchor.constraint(equalToConstant: 200)])
    }
    private func constrainGroupOneLabel() {
        view.addSubview(groupOneLabel)
        groupOneLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            groupOneLabel.topAnchor.constraint(equalTo: adLabel.bottomAnchor, constant: 25),
            groupOneLabel.leadingAnchor.constraint(equalTo: adLabel.leadingAnchor),
            groupOneLabel.trailingAnchor.constraint(equalTo: adLabel.trailingAnchor),
            groupOneLabel.heightAnchor.constraint(equalToConstant: 300)])
    }
    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()

    }

}
