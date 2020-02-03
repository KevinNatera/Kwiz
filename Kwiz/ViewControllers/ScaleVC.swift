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
    var feather: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        image.backgroundColor = #colorLiteral(red: 1, green: 0.8688890338, blue: 0.8717179298, alpha: 1)
        return image
    }()
    var mysteryBox: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        label.text = "?"
        label.font = UIFont(name: "System", size: 20)
        label.textAlignment = .center
        label.textColor = .white
        image.addSubview(label)
        label.center = image.center
        
        image.backgroundColor = .brown
        return image
    }()
    var inputBox: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        image.layer.borderWidth = 5
        image.layer.borderColor = UIColor.black.cgColor
        return image
    }()
    var triangle: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        return view
    }()
    var answer: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        image.backgroundColor = .clear
        return image
    }()
    var reset: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.isHidden = true
        return button
    }()
    
    //MARK: - Properties
    var steelPanGesture = UIPanGestureRecognizer()
    var featherPanGesture = UIPanGestureRecognizer()
    
    var steelCenter = CGPoint() {
        didSet {
            if inputBox.frame.contains(steelCenter) {
                steel.center = inputBox.center
                rotate(view: steel)
                reset.isHidden = false
            } else if answer.frame.contains(steelCenter) {
                steel.center = answer.center
                showSolution()
            }
        }
    }
    var featherCenter = CGPoint() {
        didSet {
            if inputBox.frame.contains(featherCenter) {
                feather.center = inputBox.center
                rotate(view: feather)
                reset.isHidden = false
            }
        }
    }
    var steelOriginalCenter = CGPoint()
    var featherOriginalCenter = CGPoint()
    
    
    //MARK: - Constraints
    private func setConstraints() {
        constrainLine()
        constrainAnswer()
        constrainPrompt()
        constrainMysteryBox()
        constrainInputBox()
        constrainTriangle()
        constrainSteel()
        constrainFeather()
        constrainReset()
        
        makeTriangle()
        
        rotateObjects()
        
        getOriginalCenters()
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
            steel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            steel.widthAnchor.constraint(equalToConstant: steel.frame.width),
            steel.heightAnchor.constraint(equalToConstant: steel.frame.height)])
    }
    private func constrainMysteryBox() {
        view.addSubview(mysteryBox)
        mysteryBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mysteryBox.widthAnchor.constraint(equalToConstant: mysteryBox.frame.width),
            mysteryBox.heightAnchor.constraint(equalToConstant: mysteryBox.frame.height),
            mysteryBox.bottomAnchor.constraint(equalTo: line.topAnchor, constant: 45),
            mysteryBox.leadingAnchor.constraint(equalTo: line.centerXAnchor, constant: 75)])
    }
    private func constrainInputBox() {
        view.addSubview(inputBox)
        inputBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputBox.widthAnchor.constraint(equalToConstant: inputBox.frame.width),
            inputBox.heightAnchor.constraint(equalToConstant: inputBox.frame.height),
            inputBox.leadingAnchor.constraint(equalTo: line.leadingAnchor, constant: 35),
            inputBox.bottomAnchor.constraint(equalTo: line.topAnchor, constant: -35)])
    }
    private func constrainTriangle() {
        view.addSubview(triangle)
        triangle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            triangle.widthAnchor.constraint(equalToConstant: triangle.frame.width),
            triangle.heightAnchor.constraint(equalToConstant: triangle.frame.height),
            triangle.centerXAnchor.constraint(equalTo: line.centerXAnchor),
            triangle.topAnchor.constraint(equalTo: line.bottomAnchor)])
    }
    private func constrainFeather() {
        view.addSubview(feather)
        feather.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feather.widthAnchor.constraint(equalToConstant: feather.frame.width),
            feather.heightAnchor.constraint(equalToConstant: feather.frame.height),
            feather.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            feather.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    private func constrainReset() {
        view.addSubview(reset)
        reset.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reset.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reset.centerYAnchor.constraint(equalTo: steel.centerYAnchor)])
        reset.addTarget(self, action: #selector(resetPressed), for: .touchUpInside)
    }
    private func constrainAnswer() {
        view.addSubview(answer)
        answer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            answer.trailingAnchor.constraint(equalTo: line.trailingAnchor),
            answer.topAnchor.constraint(equalTo: line.bottomAnchor),
            answer.widthAnchor.constraint(equalToConstant: answer.frame.width),
            answer.heightAnchor.constraint(equalToConstant: answer.frame.height)])
    }
    
    //MARK: Rotate
    private func rotateLine() {
        line.transform = CGAffineTransform(rotationAngle: CGFloat.pi/9)
    }
    private func rotateMysteryBox() {
        mysteryBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi/9)
    }
    private func rotate(view: UIImageView) {
        view.transform = CGAffineTransform(rotationAngle: CGFloat.pi/9)
    }
    private func rotateObjects() {
        rotateLine()
        rotateMysteryBox()
        inputBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi/9)

    }
    
    //MARK: Setup
    private func addGestures() {
        steel.isUserInteractionEnabled = true
        steelPanGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedSteel(_:)))
        steel.addGestureRecognizer(steelPanGesture)
        
        feather.isUserInteractionEnabled = true
        featherPanGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedFeather(_:)))
        feather.addGestureRecognizer(featherPanGesture)
    }
    
    //MARK: - Functions
    private func makeTriangle() {
        let path = UIBezierPath()
        let strokeColor: UIColor = .black
        let lineWidth: CGFloat = 2.0
        let shapeLayer = CAShapeLayer()
        
        path.move(to: CGPoint(x: triangle.frame.minX, y: triangle.frame.maxY))
        path.addLine(to: CGPoint(x: triangle.frame.minX, y: triangle.frame.maxY))
        path.addLine(to: CGPoint(x: triangle.frame.midX, y: triangle.frame.minY))
        path.addLine(to: CGPoint(x: triangle.frame.maxX, y: triangle.frame.maxY))
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.black.cgColor
        triangle.layer.addSublayer(shapeLayer)
    }
    private func showSolution() {
        line.transform = CGAffineTransform(rotationAngle: 0)
        inputBox.transform = CGAffineTransform(rotationAngle: 0)
        mysteryBox.transform = CGAffineTransform(rotationAngle: 0)
        
        inputBox.center = CGPoint(x: line.frame.minX + (steel.frame.width / 2), y: line.frame.minY - (steel.frame.height / 2))
        mysteryBox.center = CGPoint(x: line.frame.maxX - (steel.frame.width / 2), y: line.frame.minY - (steel.frame.height / 2))
        
        feather.isUserInteractionEnabled = false
    }
    private func getOriginalCenters() {
        view.layoutIfNeeded()
        steelOriginalCenter = CGPoint(x: steel.center.x, y: steel.center.y - 34)
        featherOriginalCenter = CGPoint(x: feather.center.x, y: feather.center.y - 34)
    }
    
    
    //MARK: Objc Func
    @objc private func draggedSteel(_ sender: UIPanGestureRecognizer) {
        steel.transform = CGAffineTransform.identity
        feather.transform = CGAffineTransform.identity
        view.bringSubviewToFront(steel)
        let translation = sender.translation(in: view)
        steel.center = CGPoint(x: steel.center.x + translation.x, y: steel.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
        steelCenter = steel.center
    }
    @objc private func draggedFeather(_ sender: UIPanGestureRecognizer) {
        steel.transform = CGAffineTransform.identity
        feather.transform = CGAffineTransform.identity
        view.bringSubviewToFront(feather)
        let translation = sender.translation(in: view)
        feather.center = CGPoint(x: feather.center.x + translation.x, y: feather.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
        featherCenter = feather.center
    }
    @objc private func resetPressed() {
        steel.center = steelOriginalCenter
        feather.center = featherOriginalCenter
        
        steel.transform = CGAffineTransform.identity
        feather.transform = CGAffineTransform.identity
        
        reset.isHidden = true
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        addGestures()
    }
    

    

}
