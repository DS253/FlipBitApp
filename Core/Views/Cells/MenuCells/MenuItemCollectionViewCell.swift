//
//  MenuItemCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 3/19/18.
//  Copyright © 2018 iOS App Templates. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell, MenuItemCollectionViewCellProtocol {

    @IBOutlet var menuImageView: UIImageView!
    @IBOutlet var menuLabel: UILabel!

    func configure(item: NavigationItem) {
        menuImageView.image = item.image
        menuLabel.text = item.title
    }
}
