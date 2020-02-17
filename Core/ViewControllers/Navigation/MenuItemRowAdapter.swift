//
//  MenuItemRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class MenuItemRowAdapter: GenericCollectionRowAdapter {
    
    let cellClassType: UICollectionViewCell.Type
    let uiConfig: MenuUIConfiguration
    
    init(cellClassType: UICollectionViewCell.Type, uiConfig: MenuUIConfiguration) {
        self.cellClassType = cellClassType
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let item = object as? NavigationItem, let cell = cell as? MenuItemCollectionViewCellProtocol else {
            fatalError()
        }
        cell.configure(item: item)
        cell.menuLabel.font = uiConfig.itemFont
        cell.menuLabel.textColor = uiConfig.tintColor
        cell.menuImageView.tintColor = uiConfig.tintColor
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return cellClassType
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        return CGSize(width: containerBounds.width, height: uiConfig.itemHeight)
    }
}
