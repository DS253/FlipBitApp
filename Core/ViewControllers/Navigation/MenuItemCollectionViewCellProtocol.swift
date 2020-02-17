//
//  MenuItemCollectionViewCellProtocol.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol MenuItemCollectionViewCellProtocol: MenuCollectionViewCellConfigurable {
    var menuImageView: UIImageView! { get set }
    var menuLabel: UILabel! { get set }
}
