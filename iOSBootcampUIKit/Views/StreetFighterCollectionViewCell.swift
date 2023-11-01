//
//  StreetFighterCollectionViewCell.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import UIKit

class StreetFighterCollectionViewCell: UICollectionViewCell {
    static let identifier = "StreetFighterCollectionViewCell"
    
    @IBOutlet weak var fighterNameLabel: UILabel!
    @IBOutlet weak var fighterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
