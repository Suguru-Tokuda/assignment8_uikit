//
//  SettingsDetailsViewController.swift
//  Assignment8
//
//  Created by Suguru Tokuda on 10/31/23.
//

import UIKit

class SettingsDetailsViewController: UIViewController {
    var settingTitle: String?
    
    var settingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        settingLabel.text = settingTitle ?? ""
        
        view.addSubview(settingLabel)
        
        applyCostraints()
    }
    
    func applyCostraints() {
        let settingTitleConstraints = [
            settingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(settingTitleConstraints)
    }
}
