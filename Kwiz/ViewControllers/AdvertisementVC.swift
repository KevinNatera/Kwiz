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
        button.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 20)
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 10
        button.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
//        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return button
    }()
    var closeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: UIImage.SymbolWeight.medium)
        button.setImage(UIImage.init(systemName: "x.circle", withConfiguration: config), for: .normal)
        button.tintColor = .black
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    lazy var userLivesImageOne: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
        imageView.isHidden = true
        return imageView
    }()
    lazy var userLivesImageTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
        imageView.isHidden = true
        return imageView
    }()
    
    lazy var userLivesImageThree: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hearts")
        imageView.isHidden = true
        return imageView
    }()
    
    //MARK: - Setup/ Constraints
    private func setupConstraints() {
        constrainAdLabel()
        constrainGroupOneLabel()
        constrainDownloadButton()
        constrainCloseButton()
        setUpLivesStackView()
    }
    private func constrainAdLabel() {
        view.addSubview(adLabel)
        adLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            adLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            adLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            adLabel.heightAnchor.constraint(equalToConstant: 200)])
    }
    private func constrainGroupOneLabel() {
        view.addSubview(groupOneLabel)
        groupOneLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            groupOneLabel.topAnchor.constraint(equalTo: adLabel.bottomAnchor, constant: 20),
            groupOneLabel.leadingAnchor.constraint(equalTo: adLabel.leadingAnchor),
            groupOneLabel.trailingAnchor.constraint(equalTo: adLabel.trailingAnchor),
            groupOneLabel.heightAnchor.constraint(equalToConstant: 280)])
    }
    private func constrainDownloadButton() {
        view.addSubview(downloadButton)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            downloadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 220),
            downloadButton.heightAnchor.constraint(equalToConstant: 100)])
    }
    private func constrainCloseButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
        view.layoutIfNeeded()
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    private func setUpLivesStackView(){
        let stackView = UIStackView(arrangedSubviews: [userLivesImageOne, userLivesImageTwo, userLivesImageThree])
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: adLabel.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 60),
            stackView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    //MARK: - Functions
    private func animateDownloadButton() {
        UIView.animate(withDuration: 2, delay: 2, options: [.repeat], animations: { [weak self] in
            self?.downloadButton.backgroundColor = .systemRed
            self?.downloadButton.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            }, completion: nil)
    }
    private func showLives() {
        userLivesImageOne.isHidden = false
        userLivesImageTwo.isHidden = false
        userLivesImageThree.isHidden = false
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        //animateDownloadButton()

    }

}
