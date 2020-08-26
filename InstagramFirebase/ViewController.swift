//
//  ViewController.swift
//  InstagramFirebase
//
//  Created by Marina on 8/24/20.
//  Copyright © 2020 Marina. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    let plusPhotoBtn:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "plusBtn").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    let emailTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont.systemFont(ofSize: 14.0)
        textfield.addTarget(self, action: #selector(handleInputTextChanged), for: .editingChanged)
        return textfield
    }()
    
    let passwordTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.isSecureTextEntry = true
        textfield.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont.systemFont(ofSize: 14.0)
        textfield.addTarget(self, action: #selector(handleInputTextChanged), for: .editingChanged)
        return textfield
    }()
    
    let userNameTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "User Name"
        textfield.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont.systemFont(ofSize: 14.0)
        textfield.addTarget(self, action: #selector(handleInputTextChanged), for: .editingChanged)
        return textfield
    }()
    
    let signUpButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.isEnabled =  false
        btn.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSignUp(){
        guard let email = emailTextField.text , email != "" else { return }
        guard let password = passwordTextField.text , password != "" else { return }
        guard let username =  userNameTextField.text , username != "" else { return }
    
        Auth.auth().createUser(withEmail: email, password: password) { (userData, error) in

            guard error == nil else{
                print("Failed to create a user: ", error!)
                return
            }
            
            print("successfuly created user: ", userData?.user.uid ?? "" )
        }
    }
    
    @objc func handleInputTextChanged(){
        let isFormValid = emailTextField.text != "" &&
                          passwordTextField.text != "" &&
                          userNameTextField.text != ""
        
        if isFormValid{
            signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
            signUpButton.isEnabled =  true
        }
        else{
           signUpButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
            signUpButton.isEnabled =  false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(plusPhotoBtn)
        plusPhotoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        plusPhotoBtn.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        
        setupInputFields()
        
    }
    
    fileprivate func setupInputFields(){

        let stackview = UIStackView(arrangedSubviews: [emailTextField, userNameTextField , passwordTextField, signUpButton])
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        stackview.axis = .vertical
        stackview.spacing = 20
        view.addSubview(stackview)
        
        stackview.anchor(top: plusPhotoBtn.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 0, paddingRight: -40 , width: 0 , height: 200)
    }

}

extension UIView{
    func anchor(top:NSLayoutYAxisAnchor? , left: NSLayoutXAxisAnchor? , bottom:NSLayoutYAxisAnchor?, right:NSLayoutXAxisAnchor?, paddingTop:CGFloat , paddingLeft:CGFloat, paddingBottom:CGFloat , paddingRight:CGFloat , width:CGFloat , height:CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive =  true
        }
        
        if let left = left {
            self.leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive =  true
        }
        
        if let right = right {
            self.trailingAnchor.constraint(equalTo: right, constant: paddingRight).isActive =  true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive =  true
        }
        
        if width != 0{
            self.widthAnchor.constraint(equalToConstant: width).isActive =  true
        }
        
        if height != 0{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    
}

