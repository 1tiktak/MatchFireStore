//
//  RegistrationController.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 5/27/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {

    // MARK: UI conponets
    let selectPhotoButton: UIButton = {
        let button = UIButton(type: .system)
       button.setTitle("Select Photo", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 275).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    let fullNameTextField: CustomTextField = {
        let tf =  CustomTextField(padding: 16)
        tf.placeholder = "Enter couples name"
        tf.backgroundColor = .white
        return tf
        
    }()
    let emailTextField: CustomTextField = {
        let tf =  CustomTextField(padding: 16)
        tf.placeholder = "Enter email"
        tf.backgroundColor = .white
        tf.keyboardType = .emailAddress
        return tf
        
    }()
    let passwordTextField: CustomTextField = {
        let tf = CustomTextField(padding: 16)
        tf.placeholder = "Enter Password"
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        return tf
        
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0, blue: 0.3254901961, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.layer.cornerRadius = 22
        print("Sign up button pressed")
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupGradientLayer()
        view.backgroundColor = .red
        
        let stackView = UIStackView(arrangedSubviews: [selectPhotoButton, fullNameTextField, emailTextField, passwordTextField, registerButton])
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 50, bottom: 0, right: 50))
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func setupGradientLayer() {
        
        let gradientLayer = CAGradientLayer()
        
        let topColor = #colorLiteral(red: 0.9921568627, green: 0.3568627451, blue: 0.3725490196, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.8980392157, green: 0, blue: 0.4470588235, alpha: 1)
        // Make sure to use CG color
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0, 1]
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.bounds
    }
}
