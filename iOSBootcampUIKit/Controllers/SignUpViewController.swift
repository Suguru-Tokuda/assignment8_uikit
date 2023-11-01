//
//  SignUpViewController.swift
//  Assignment8
//
//  Created by Suguru Tokuda on 10/30/23.
//

import UIKit

class SignUpViewController : UIViewController {
    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var resetPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Repeat Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var agreementCheckboxDescription: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        
        var checkbox = UIView()
        checkbox.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        checkbox.layer.borderColor = UIColor.black.cgColor
        checkbox.layer.borderWidth = 1.5
        checkbox.layer.cornerRadius = 2
        checkbox.backgroundColor = .red
        
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        
        var label = UILabel()
        label.text = "I agree all statements in"
        
        var termsOfServiceBtn = UIButton(type: .system)
        termsOfServiceBtn.setTitle("terms of service", for: .normal)
        termsOfServiceBtn.setTitleColor(.orange, for: .normal)
        termsOfServiceBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        
        stackView.addArrangedSubview(checkbox)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(termsOfServiceBtn)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var signUpBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.tintColor = UIColor.orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addBottomLineToTextField(0.0, 40, view.frame.width - 50, 1.0)
        passwordTextField.addBottomLineToTextField(0.0, 40, view.frame.width - 50, 1.0)
        resetPasswordTextField.addBottomLineToTextField(0.0, 40, view.frame.width - 50, 1.0)
        signUpBtn.frame = CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 40)

        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(resetPasswordTextField)
        view.addSubview(agreementCheckboxDescription)
        view.addSubview(signUpBtn)
                
        applyConstraints()
    }
    
    private func applyConstraints() {
        let emailTextFieldConstraints = [
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let resetPasswordTextFieldConstraints = [
            resetPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resetPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resetPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            resetPasswordTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let agreementCheckboxDescriptionConstraints = [
            agreementCheckboxDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            agreementCheckboxDescription.topAnchor.constraint(equalTo: resetPasswordTextField.bottomAnchor, constant: 30),
            agreementCheckboxDescription.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let signUpBtnConstraints = [
            signUpBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            signUpBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            signUpBtn.topAnchor.constraint(equalTo: agreementCheckboxDescription.bottomAnchor, constant: 20),
            signUpBtn.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(resetPasswordTextFieldConstraints)
        NSLayoutConstraint.activate(agreementCheckboxDescriptionConstraints)
        NSLayoutConstraint.activate(signUpBtnConstraints)
    }
}
