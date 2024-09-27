//
//  UITextField.swift
//  Assignment8
//
//  Created by Suguru Tokuda on 10/30/23.
//

import UIKit

extension UITextField {
    func addBottomLineToTextField(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRectMake(x, y, width, height)
        bottomLine.backgroundColor = UIColor.black.cgColor.copy(alpha: 0.2)
        self.layer.addSublayer(bottomLine)
    }
}
