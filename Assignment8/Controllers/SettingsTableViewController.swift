//
//  SettingsViewController.swift
//  Assignment8
//
//  Created by Suguru Tokuda on 10/31/23.
//

import UIKit

class SettingsViewController: UIViewController {
    let settingSections: [String] = ["Cellular & Network", "Sounds", "Miscs"]
    let settingDict: [Int : [SettingModel]] = [
        0 : [
            SettingModel(name: "Airplane Mode", icon: "airplane", color: .orange),
            SettingModel(name: "Wi-Fi", icon: "wifi", color: .blue),
            SettingModel(name: "Cellular", icon: "antenna.radiowaves.left.and.right", color: .green)
        ],
        1: [
            SettingModel(name: "Notifications", icon: "bell.fill", color: .red),
            SettingModel(name: "Focus", icon: "moon.fill", color: .purple)
        ],
        2: [
            SettingModel(name: "General", icon: "gear", color: .gray),
            SettingModel(name: "Display & Brightness", icon: "sun.min.fill", color: .blue),
            SettingModel(name: "Battery", icon: "battery.100percent", color: .systemGreen)
        ]
    ]
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Settings"
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension SettingsViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingDict.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (settingDict[section] ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        
        let setting = (self.settingDict[indexPath.section] ?? [])[indexPath.row]
        
        cell.setValue(setting: setting)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingSections[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension SettingsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let settings = settingDict[indexPath.section] {
            let vc = SettingsDetailsViewController()
            vc.settingTitle = settings[indexPath.row].name
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
