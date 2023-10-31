//
//  ResetPasswordViewController.swift
//  Assignment8
//
//  Created by Suguru Tokuda on 10/30/23.
//

import UIKit

class ResetPasswordViewController : UIViewController {
    
    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private var sendBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.tintColor = UIColor.orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange
        return button
    }()
    
    private var viewDescription: UILabel = {
        let label = UILabel()
        label.text = "Enter your E-mail and we will send you a new password."
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.tintColor = .black
        emailTextField.addBottomLineToTextField(0.0, 40, view.frame.width - 50, 1.0)
        sendBtn.frame = CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 40)
        viewDescription.frame = CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 40)
        
        view.addSubview(emailTextField)
        view.addSubview(sendBtn)
        view.addSubview(viewDescription)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let emailTextFieldConstraints = [
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let sendBtnConstraints = [
            sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            sendBtn.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            sendBtn.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let viewDescriptionConstraints = [
            viewDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            viewDescription.topAnchor.constraint(equalTo: sendBtn.bottomAnchor, constant: 10),
            viewDescription.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(sendBtnConstraints)
        NSLayoutConstraint.activate(viewDescriptionConstraints)
    }
}
