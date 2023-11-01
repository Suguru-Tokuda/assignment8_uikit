//
//  SettingTableViewCell.swift
//  Assignment8
//
//  Created by Suguru Tokuda on 10/31/23.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    private var setting: SettingModel?
    static let identifier = "settingTableViewCell"
    
    var iconView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .systemGray6
        return view
    }()
    
    var settingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black.withAlphaComponent(0.8)
        return label
    }()
    
    var trailingArrowIcon: UIImageView = {
        var view = UIImageView()
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if let image = UIImage(systemName: "chevron.right") {
            view.image = image
        }
        
        view.tintColor = .systemGray
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconView)
        contentView.addSubview(settingLabel)
        contentView.addSubview(trailingArrowIcon)
        
        // enable constraints
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue(setting: SettingModel) {
        self.setting = setting
        
        if let setting = self.setting {
            if let image = UIImage(systemName: setting.icon)?.withAlignmentRectInsets(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)) {
                iconView.backgroundColor = setting.color
                iconView.tintColor = .white
                iconView.image = image
            }
            
            settingLabel.text = setting.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func applyConstraints() {
        let iconViewConstrants = [
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 15),
            iconView.heightAnchor.constraint(equalToConstant: 15)
        ]
        
        let settingLabelConstrants = [
            settingLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 40),
            settingLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor)
        ]
        
        let trailingArrowIconConstraints = [
            trailingArrowIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            trailingArrowIcon.centerYAnchor.constraint(equalTo: settingLabel.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(iconViewConstrants)
        NSLayoutConstraint.activate(settingLabelConstrants)
        NSLayoutConstraint.activate(trailingArrowIconConstraints)
    }
}
