//
//  KeyboardKeyRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class KeyboardKeyRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let key = object as? KeyboardKey, let cell = cell as? ATCKeyboardKeyCollectionViewCell {
            cell.keyLabel.text = key.displayValue
            cell.keyLabel.textColor = uiConfig.mainTextColor
            cell.keyLabel.font = uiConfig.boldFont(size: 24)
            
            cell.backgroundColor = uiConfig.mainThemeBackgroundColor
            cell.containerView.backgroundColor = .clear
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCKeyboardKeyCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is KeyboardKey else { return .zero }
        return CGSize(width: containerBounds.width / 3, height: 70)
    }
}
