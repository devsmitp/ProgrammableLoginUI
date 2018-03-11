//
//  LoginController.swift
//  ProgrammableLoginUI
//
//  Created by Smit Patel on 3/11/18.
//  Copyright © 2018 devsmitp. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

//MARK: SubViews
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        view.addSubview(SegmentLoginRegisterButton)

//MARK: HomeScreen Background
        view.backgroundColor = UIColor(red: 61, green: 91, blue: 151 )
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        
//MARK: Setup ViewContainer/Button
        setupViewContainer()
        setuploginRegisterButton()
        setupProfileImageView()
        setupLoginSegmentRegister()
    }
    
//MARK: SegmentLoginRegisterButton
    lazy var SegmentLoginRegisterButton : UISegmentedControl = {
        let segmentButton = UISegmentedControl(items: ["Login","Register"])
        segmentButton.tintColor = UIColor.white
        segmentButton.selectedSegmentIndex = 1
        segmentButton.translatesAutoresizingMaskIntoConstraints = false
        segmentButton.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return segmentButton
        }()
    
//MARK: handleLoginRegisterChange
    @objc func handleLoginRegisterChange() {
        let title = SegmentLoginRegisterButton.titleForSegment(at: SegmentLoginRegisterButton.selectedSegmentIndex)
            loginRegisterButton.setTitle(title, for: .normal)
        inputsContainerViewHeightAnchor?.constant = SegmentLoginRegisterButton.selectedSegmentIndex == 0 ? 100 : 150
            nameTextFieldHieghtAnchor?.isActive = false
        nameTextFieldHieghtAnchor = nametextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: SegmentLoginRegisterButton.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHieghtAnchor?.isActive = true
        emailTextFieldHieghtAnchor?.isActive = false
        emailTextFieldHieghtAnchor = emailtextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: SegmentLoginRegisterButton.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHieghtAnchor?.isActive = true
        passwordTextFieldHieghtAnchor?.isActive = false
        passwordTextFieldHieghtAnchor = passwordtextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: SegmentLoginRegisterButton.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHieghtAnchor?.isActive = true
        }
    
//MARK: LoginSegment Constraints
        func setupLoginSegmentRegister() {
        SegmentLoginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        SegmentLoginRegisterButton.bottomAnchor.constraint(equalTo: nametextField.topAnchor, constant: -15).isActive = true
        SegmentLoginRegisterButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        SegmentLoginRegisterButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }

//MARK: ProfileImageView Constraints
    func setupProfileImageView() {
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: SegmentLoginRegisterButton.topAnchor, constant: -15).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        }
        let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "eagleImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        }()
    
//MARK: loginRegisterButton Constraints
    func setuploginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 102).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
        var inputsContainerViewHeightAnchor : NSLayoutConstraint?
        var nameTextFieldHieghtAnchor : NSLayoutConstraint?
        var emailTextFieldHieghtAnchor : NSLayoutConstraint?
        var passwordTextFieldHieghtAnchor : NSLayoutConstraint?
    
//MARK: ViewContainer Constraints
    func setupViewContainer()  {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor , constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerViewHeightAnchor?.isActive = true
        
//MARK: SubView Fields of Name, Email, Password
        inputsContainerView.addSubview(nametextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailtextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordtextField)
        inputsContainerView.addSubview(passwordSeparatorView)
        
//MARK: nameTextField Constraints
        nametextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nametextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 3).isActive = true
        nametextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextFieldHieghtAnchor = nametextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHieghtAnchor?.isActive = true
        
//MARK: nameSeparatorView Constraints
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nametextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
//MARK: EmailTextField Constraints
        emailtextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 10).isActive = true
        emailtextField.topAnchor.constraint(equalTo: nametextField.bottomAnchor).isActive = true
        emailtextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHieghtAnchor = emailtextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHieghtAnchor?.isActive = true
        
//MARK: EmailSeparatorView Constraints
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailtextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
//MARK: passwordTextField Constraints
        passwordtextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordtextField.topAnchor.constraint(equalTo: emailtextField.bottomAnchor).isActive = true
        passwordtextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHieghtAnchor =
            passwordtextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHieghtAnchor?.isActive = true
        }
        lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 80, green: 101, blue: 160 )
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
        }()
    
//MARK: handleloginRegister
        @objc func handleRegister(){
        self.dismiss(animated: true, completion: nil)
        }
    
//MARK: handleLogin
        func handlelogin(){
        self.dismiss(animated: true, completion: nil)
        }
    
//MARK: inputsContainer
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
//MARK: Name Field
    let nametextField : UITextField = {
        let textField1 = UITextField()
        textField1.placeholder = "Name"
        textField1.translatesAutoresizingMaskIntoConstraints = false
        return textField1
    }()
    let nameSeparatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220, green: 220, blue: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

//MARK: Email Field
    let emailtextField : UITextField = {
        let textField1 = UITextField()
        textField1.placeholder = "Email"
        textField1.translatesAutoresizingMaskIntoConstraints = false
        return textField1
    }()
    let emailSeparatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220, green: 220, blue: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//MARK: Password Field
    let passwordtextField : UITextField = {
        let textField1 = UITextField()
        textField1.placeholder = "Password"
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1.isSecureTextEntry = true
        return textField1
    }()
    let passwordSeparatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220, green: 220, blue: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func PreferredStatusBarStyle() -> UIStatusBarStyle {
        return.lightContent
    }
    }
//MARK: Color Extension
    extension UIColor {
    convenience init (red: CGFloat, green: CGFloat, blue:CGFloat ){
        self.init(red: red/255, green: green/255 , blue: blue/255, alpha: 1 )
    }
    }


