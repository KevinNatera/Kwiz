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
        label.text = "You exercised your mind for a while now ...\n\nHow about exercising your body?"
        label.numberOfLines = 5
        label.font = UIFont(name: "Verdana-Bold", size: 25)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return label
    }()
    var groupOneLabel: UILabel = {
        let label = UILabel()
        label.text = "💪Get rock hard muscles with FitBuddy!!\n\n This app will help you build or join a community at your local gym,\nfind workouts to suit your needs and more!"
        label.textAlignment = .center
        label.numberOfLines = 15
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        return label
    }()
    var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download Today!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
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
        button.backgroundColor = #colorLiteral(red: 0.8694844842, green: 0.8631995916, blue: 0.8742966056, alpha: 1)
        return button
    }()
    var infoButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: UIImage.SymbolWeight.medium)
        button.setImage(UIImage.init(systemName: "info.circle", withConfiguration: config), for: .normal)
        button.tintColor = .black
        button.backgroundColor = #colorLiteral(red: 0.8694844842, green: 0.8631995916, blue: 0.8742966056, alpha: 1)
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
    var stackView = UIStackView()
    var heartStack = HeartsStackView(livesRemaining: Game.shared.getLives())
    
    //MARK: - Properties
    var center = CGPoint.zero
    
    //MARK: - Setup/ Constraints
    private func setupConstraints() {
        constrainAdLabel()
        constrainGroupOneLabel()
        constrainDownloadButton()
        constrainCloseButton()
        setUpLivesStackView()
        constrainInfoButton()
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
            groupOneLabel.heightAnchor.constraint(equalToConstant: 350)])
    }
    private func constrainDownloadButton() {
        view.addSubview(downloadButton)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.addTarget(self, action: #selector(downloadButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            downloadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 220),
            downloadButton.heightAnchor.constraint(equalToConstant: 100)])
    }
    private func constrainCloseButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(loselife), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
        
        view.layoutIfNeeded()
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    private func setUpLivesStackView(){
        heartStack.isHidden = true
        view.addSubview(heartStack)
        
        heartStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartStack.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -20),
            heartStack.bottomAnchor.constraint(equalTo: adLabel.topAnchor),
            heartStack.heightAnchor.constraint(equalToConstant: 60),
            heartStack.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    private func constrainInfoButton() {
        view.addSubview(infoButton)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.addTarget(self, action: #selector(loselife), for: .touchUpInside)
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 5),
            infoButton.leadingAnchor.constraint(equalTo: closeButton.leadingAnchor)])
        view.layoutIfNeeded()
        infoButton.layer.cornerRadius = infoButton.frame.height / 2
    }
    
    //MARK: - Functions
    private func animateDownloadButton() {
        UIView.animate(withDuration: 2, delay: 2, options: [.repeat], animations: { [weak self] in
            self?.downloadButton.backgroundColor = .systemRed
            self?.downloadButton.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            }, completion: nil)
    }
    private func showLives() {
        heartStack.isHidden = false
        center = heartStack.center
    }
    //MARK: Objc Functions
    @objc private func loselife() {
        showLives()
        Game.shared.reduceLives()
        heartStack.loseLife(remaining: Game.shared.getLives())
    }
    @objc private func downloadButtonPressed() {
        Game.shared.increaseScoreForSpecialQuestions()
        Game.shared.switchAndGetNextTypeOfQuestion()
        let vc = useNextTypeToCallVC(nextType: Game.shared.getNextType())
        navigationController?.pushViewController(vc, animated: true)
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.7633551359, blue: 0.2501748204, alpha: 1)
        setupConstraints()
        //animateDownloadButton()

    }

}
