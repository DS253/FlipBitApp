//
//  BorderedButton.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {
    func configure(tintColor: UIColor = .blue,
                   font: UIFont,
                   bgColor: UIColor = .white,
                   borderColor: UIColor,
                   borderWidth: CGFloat = 1,
                   cornerRadius: CGFloat) {
        self.backgroundColor = bgColor
        self.tintColor = tintColor
        self.titleLabel?.font = font
        self.titleLabel?.textColor = tintColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
}
