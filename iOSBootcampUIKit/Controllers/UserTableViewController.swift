//
//  UserTableViewController.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import UIKit

class UserTableViewController: UIViewController {
    var users: [User] = []
    
    var tableView: UITableView = {
        let tableView = UITableView()
        let cellXib = UINib(nibName: UserTableViewCell.identifier, bundle: nil)
        tableView.register(cellXib, forCellReuseIdentifier: UserTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadUsersFromJson()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension UserTableViewController {
    private func setUpUI() {
        view.addSubview(tableView)
        tableView.dataSource = self
    }
    
    private func loadUsersFromJson() {
        let bundle = Bundle(for: UserTableViewController.self)
        let url = bundle.url(forResource: "userData", withExtension: "json")
        guard let url = url else { return }
        
        do {
            let rawData = try Data(contentsOf: url)
            
            let userData: UserDataModel = try JSONDecoder().decode(UserDataModel.self, from: rawData)
            self.users = userData.data
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension UserTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell {
            cell.userNameLabel.text = users[indexPath.row].fullName
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension UserTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}
