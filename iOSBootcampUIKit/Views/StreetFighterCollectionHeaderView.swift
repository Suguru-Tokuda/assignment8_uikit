//
//  StreetFighterCollectionHeaderView.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import UIKit

class StreetFighterCollectionHeaderView: UICollectionReusableView {
    static let identifier = "StreetFighterCollectionHeaderView"
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func configure(country: Country) {
        backgroundColor = .black.withAlphaComponent(0.8)
        countryLabel.text = country.rawValue
        addSubview(countryLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        countryLabel.frame = bounds
        applyConstraints()
    }
    
    func applyConstraints() {
        let countryLabelConstraints = [
            countryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40)
        ]
        
        NSLayoutConstraint.activate(countryLabelConstraints)
    }
}
