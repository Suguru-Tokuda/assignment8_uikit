//
//  ResetPasswordConfirmationViewController.swift
//  Assignment8
//
//  Created by Suguru Tokuda on 10/31/23.
//

import UIKit

class ResetPasswordConfirmationViewController: UIViewController {
    var email: String?
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let screenLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Sent"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black.withAlphaComponent(0.8)
        
        return label
    }()
    
    private let screenDescription: UILabel = {
        let label = UILabel()
        label.text = "Please check your email and proceed the reset password."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black.withAlphaComponent(0.6)

        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private let emailDisplayLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        screenLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width * 0.4, height: 40.0)
        screenDescription.frame = CGRect(x: 0, y: 0, width: view.frame.width * 0.8, height: 40)
        contentView.addSubview(screenLabel)
        contentView.addSubview(screenDescription)
        contentView.addSubview(emailLabel)
        contentView.addSubview(emailDisplayLabel)
        
        view.addSubview(contentView)
        
        emailDisplayLabel.text = self.email ?? ""
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let contentViewConstraints = [
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ]
        
        let screenLabelConstraints = [
            screenLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            screenLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
        
        let screenDescriptionConstraints = [
            screenDescription.topAnchor.constraint(equalTo: screenLabel.bottomAnchor, constant: 5),
            screenDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ]
        
        let emailLabelConstraints = [
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: screenLabel.topAnchor, constant: 200)
        ]
        
        let emailDisplayLabelContraints = [
            emailDisplayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            emailDisplayLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5)
        ]
        
        NSLayoutConstraint.activate(contentViewConstraints)
        NSLayoutConstraint.activate(screenLabelConstraints)
        NSLayoutConstraint.activate(screenDescriptionConstraints)
        NSLayoutConstraint.activate(emailLabelConstraints)
        NSLayoutConstraint.activate(emailDisplayLabelContraints)
    }
}
