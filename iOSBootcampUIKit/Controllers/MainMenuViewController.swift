//
//  MainMenuViewController.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import UIKit

class MainMenuViewController : UIViewController {
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var streetFighterGridViewBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Street Fighter 6 Characters", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.purple.withAlphaComponent(0.8)
        return btn
    }()
    
    private var userTableViewBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Get User List", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.green.withAlphaComponent(0.8)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}

// MARK: UI Setup
extension MainMenuViewController {
    private func setUpUI() {
        view.backgroundColor = .white
        view.largeContentTitle = "Main Menu"
        self.parent?.title = "Main Menu"
        scrollView.addSubview(streetFighterGridViewBtn)
        scrollView.addSubview(userTableViewBtn)
        streetFighterGridViewBtn.frame = CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 60)
        
        view.addSubview(scrollView)
        
        addEventHandlers()        
        applyConstraints()
    }
}

// MARK: Constraints
extension MainMenuViewController {
    func applyConstraints() {
        let scrollViewConstrants = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let streetFighterGridViewBtnConstraints = [
            streetFighterGridViewBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            streetFighterGridViewBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            streetFighterGridViewBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ]
        
        let userTableViewBtnConstraints = [
            userTableViewBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userTableViewBtn.topAnchor.constraint(equalTo: streetFighterGridViewBtn.bottomAnchor, constant: 20),
            userTableViewBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ]
        
        NSLayoutConstraint.activate(scrollViewConstrants)
        NSLayoutConstraint.activate(streetFighterGridViewBtnConstraints)
        NSLayoutConstraint.activate(userTableViewBtnConstraints)
    }
}

// MARK: Add event hendlers
extension MainMenuViewController {
    func addEventHandlers() {
        streetFighterGridViewBtn.addTarget(self, action: #selector(sf6CharatersBtnTapped), for: .touchUpInside)
        userTableViewBtn.addTarget(self, action: #selector(userTableViewBtnTapped), for: .touchUpInside)
    }
}

// MARK: Event handlers
extension MainMenuViewController {
    @objc func sf6CharatersBtnTapped() {
        let vc = StreetFighterCharacterCollectionViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func userTableViewBtnTapped() {
        let vc = UserTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
