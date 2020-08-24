//
//  ViewController.swift
//  InstagramFirebase
//
//  Created by Marina on 8/24/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let plusPhotoBtn:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "plusBtn").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let emailTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont.systemFont(ofSize: 14.0)
        return textfield
    }()
    
    let passwordTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont.systemFont(ofSize: 14.0)
        return textfield
    }()
    
    let userNameTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "User Name"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont.systemFont(ofSize: 14.0)
        return textfield
    }()
    
    let signUpButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.backgroundColor = UIColor(red: 149/256, green: 204/256, blue: 244/256, alpha: 1)
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(plusPhotoBtn)
        
        plusPhotoBtn.heightAnchor.constraint(equalToConstant: 140).isActive = true
        plusPhotoBtn.widthAnchor.constraint(equalToConstant: 140).isActive = true
        plusPhotoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        plusPhotoBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        setupInputFields()
        
    }
    
    fileprivate func setupInputFields(){
        let signUpBtnView = UIView()
        signUpBtnView.translatesAutoresizingMaskIntoConstraints = false
        signUpBtnView.addSubview(signUpButton)

        let stackview = UIStackView(arrangedSubviews: [emailTextField, userNameTextField , passwordTextField, signUpBtnView])
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        stackview.axis = .vertical
        stackview.spacing = 20
        stackview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackview)
        stackview.topAnchor.constraint(equalTo: plusPhotoBtn.bottomAnchor, constant: 20).isActive = true
        stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        //stackview.heightAnchor.constraint(equalToConstant: 260).isActive = true
        signUpButton.topAnchor.constraint(equalTo: signUpBtnView.topAnchor, constant: 0).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: signUpBtnView.bottomAnchor, constant: 0).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: signUpBtnView.leadingAnchor, constant: 40).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: signUpBtnView.trailingAnchor, constant: -40).isActive = true
        
        
    }

}

