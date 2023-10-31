//
//  ViewController.swift
//  Assignment8
//
//  Created by Suguru Tokuda on 10/30/23.
//

import UIKit

class ViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
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
    
    private var signInBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.tintColor = UIColor.orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange
        return button
    }()
    
    private var forgotPasswordBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot the password?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private var orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black.withAlphaComponent(0.2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var signInWithFacebookBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In with Facebook", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.blue.cgColor
        
        var config = UIButton.Configuration.filled()
        
        config.image = UIImage(named: "facebook_logo")?.imageWith(newSize: CGSize(width: 20, height: 20))
        config.imagePadding = 10
        config.imagePlacement = .leading
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .small)
        button.configuration = config
        
        var background = UIButton.Configuration.plain().background
        background.cornerRadius = 20
        background.strokeWidth = 1
        background.backgroundColor = UIColor.white
        background.strokeColor = UIColor.blue
        config.background = background
        button.configuration = config
        
        return button
    }()
    
    private var signInWithGoogleBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        
        var config = UIButton.Configuration.filled()
        
        config.image = UIImage(named: "google_logo")?.imageWith(newSize: CGSize(width: 20, height: 20))
        config.imagePadding = 10
        config.imagePlacement = .leading
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .small)
        button.configuration = config
        
        var background = UIButton.Configuration.plain().background
        background.cornerRadius = 20
        background.strokeWidth = 1
        background.backgroundColor = UIColor.white
        background.strokeColor = UIColor.black
        config.background = background
        button.configuration = config
        
        return button
    }()
    
    private var signUpTextBtn: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        
        return button
    }()
    
    private var signUpDescription: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        var label = UILabel()
        label.text = "Don't you have account yet?"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        stackView.addArrangedSubview(label)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        
        // add event handler
        forgotPasswordBtn.addTarget(self, action: #selector(handleForgotPasswordBtnTapped), for: .touchUpInside)
        signUpTextBtn.addTarget(self, action: #selector(handleSignUpBtnTapped), for: .touchUpInside)
                
        emailTextField.addBottomLineToTextField(0.0, 40, view.frame.width - 50, 1.0)
        passwordTextField.addBottomLineToTextField(0.0, 40, view.frame.width - 50, 1.0)

        setBtnFrame(button: &signInBtn)
        setBtnFrame(button: &forgotPasswordBtn)
        setBtnFrame(button: &signInWithFacebookBtn)
        setBtnFrame(button: &signInWithGoogleBtn)
        setViewFrame(uiView: &signUpDescription)
        
        signUpDescription.addArrangedSubview(signUpTextBtn)
        
//        scrollView.frame = view.bounds
        contentView.frame = view.bounds
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        contentView.addSubview(label)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(signInBtn)
        contentView.addSubview(forgotPasswordBtn)
        contentView.addSubview(orLabel)
        contentView.addSubview(signInWithFacebookBtn)
        contentView.addSubview(signInWithGoogleBtn)
        contentView.addSubview(signUpDescription)
                
        applyConstraints()
    }
    
    private func setViewFrame(uiView: inout UIStackView) {
        uiView.frame = CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 40)
    }
    
    private func setBtnFrame(button: inout UIButton) {
        button.frame = CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 40)
    }
    
    func applyConstraints() {
        let scrollViewConstrants = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ]
        
        let labelConstraints = [
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50)
        ]

        let emailTextFieldConstraints = [
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            emailTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ]

        let passwordTextFieldConstraints = [
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ]

        let signInBtnConstraints = [
            signInBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            signInBtn.widthAnchor.constraint(equalToConstant: 300),
            signInBtn.heightAnchor.constraint(equalToConstant: 40)
        ]

        let forgotPasswordBtnConstraints = [
            forgotPasswordBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordBtn.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: 20),
            forgotPasswordBtn.widthAnchor.constraint(equalToConstant: 300),
            forgotPasswordBtn.heightAnchor.constraint(equalToConstant: 40)
        ]

        let orLabelConstraints = [
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: forgotPasswordBtn.bottomAnchor, constant: 30),
            orLabel.heightAnchor.constraint(equalToConstant: 40)
        ]

        let signInWithFacebookBtnConstraints = [
            signInWithFacebookBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInWithFacebookBtn.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 30),
            signInWithFacebookBtn.widthAnchor.constraint(equalToConstant: 300),
            signInWithFacebookBtn.heightAnchor.constraint(equalToConstant: 40)
        ]

        let signInWithGoogleBtnConstraints = [
            signInWithGoogleBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInWithGoogleBtn.topAnchor.constraint(equalTo: signInWithFacebookBtn.bottomAnchor, constant: 20),
            signInWithGoogleBtn.widthAnchor.constraint(equalToConstant: 300),
            signInWithGoogleBtn.heightAnchor.constraint(equalToConstant: 40)
        ]

        let signUpDescriptionConstraints = [
            signUpDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            signUpDescription.heightAnchor.constraint(equalToConstant: 40)
        ]

        NSLayoutConstraint.activate(scrollViewConstrants)
        NSLayoutConstraint.activate(contentViewConstraints)
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(signInBtnConstraints)
        NSLayoutConstraint.activate(forgotPasswordBtnConstraints)
        NSLayoutConstraint.activate(orLabelConstraints)
        NSLayoutConstraint.activate(signInWithFacebookBtnConstraints)
        NSLayoutConstraint.activate(signInWithGoogleBtnConstraints)
        NSLayoutConstraint.activate(signUpDescriptionConstraints)
    }

    @objc func handleForgotPasswordBtnTapped() {
        self.performSegue(withIdentifier: "resetPassword", sender: nil)
    }
                                
    @objc func handleSignUpBtnTapped() {
        self.performSegue(withIdentifier: "signUp", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "resetPassword":
            let backItem = UIBarButtonItem()
                backItem.title = "Reset Password"
                navigationItem.backBarButtonItem = backItem
        case "signUp":
            let backItem = UIBarButtonItem()
                backItem.title = "Sign Up"
                navigationItem.backBarButtonItem = backItem
        default:
            break
        }
    }
}

