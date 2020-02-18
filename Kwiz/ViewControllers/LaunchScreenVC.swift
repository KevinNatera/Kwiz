//
//  LaunchScreenVC.swift
//  Kwiz
//
//  Created by Kevin Natera on 1/27/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit
import Lottie

class LaunchScreenVC: UIViewController {
    
    lazy var lottieView: AnimationView = {
        let view = AnimationView(name: "6285nafas")
        view.contentMode = .scaleToFill
        view.respectAnimationFrameRate = false
        view.animationSpeed = 1.5
        
        return view
    }()
    
    lazy var logo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoclear")
        
        return view
    }()
    
    lazy var logoK: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoK")
        view.isHidden = false
        
        return view
    }()
    
    lazy var logoW: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoW")
        view.isHidden = false
        
        return view
    }()
    
    lazy var logoI: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoI")
        view.isHidden = false
        
        return view
    }()
    
    lazy var logoZ: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoZ")
        view.isHidden = false
        
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        lottieViewConstraint()
        startAnimation()
        logoAnimation()
    }
    
    private func startAnimation(){
        lottieView.play(toFrame: 500 ) //6285nafas last 47.50 seconds
    }
    
    private func logoAnimation(){
        UIImageView.animateKeyframes(withDuration: 2, delay: 0, options: .beginFromCurrentState, animations:  {
            self.logoW.transform = CGAffineTransform(translationX: 80, y: 0)
            self.logoI.transform = CGAffineTransform(translationX: 170, y: 0)
            self.logoZ.transform = CGAffineTransform(translationX: 195, y: 0)
        }) { (Bool) in
            
            let vc = MainVC()
            //let ls = LaunchScreenVC()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
//            vc.transition(from: ls, to: vc, duration: 3, options: .curveEaseIn, animations: {
//            }, completion: nil)
            self.present(vc, animated: true, completion: nil)
            
        }
        
        
    }
    
    func lottieViewConstraint(){
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        logoK.translatesAutoresizingMaskIntoConstraints = false
        logoW.translatesAutoresizingMaskIntoConstraints = false
        logoI.translatesAutoresizingMaskIntoConstraints = false
        logoZ.translatesAutoresizingMaskIntoConstraints = false
        
        //        view.addSubview(logo)
        //        view.addSubview(lottieView)
        view.insertSubview(logo, at: 1)
        view.insertSubview(lottieView, at: 0)
        view.insertSubview(logoK, at: 2)
        view.insertSubview(logoW, at: 3)
        view.insertSubview(logoI, at: 4)
        view.insertSubview(logoZ, at: 5)
        
        NSLayoutConstraint.activate([
            
            lottieView.topAnchor.constraint(equalTo: view.topAnchor),
            lottieView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lottieView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lottieView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.heightAnchor.constraint(equalToConstant: 200),
            logo.widthAnchor.constraint(equalToConstant: 200),
            
            logoK.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
            logoK.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            logoK.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            logoK.widthAnchor.constraint(equalToConstant: 50),
            
            logoW.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
            logoW.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            logoW.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            logoW.widthAnchor.constraint(equalToConstant: 80),
            
            logoI.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
            logoI.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            logoI.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            
            logoZ.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
            logoZ.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            logoZ.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            
        ])
    }
    
    
    
}
