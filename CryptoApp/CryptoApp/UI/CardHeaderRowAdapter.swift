//
//  CardHeaderRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class CardHeaderRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let header = object as? CardHeaderModel, let cell = cell as? CardHeaderCollectionViewCell {
            cell.headerTitleLabel.text = header.title
            cell.headerTitleLabel.textColor = uiConfig.mainTextColor
            cell.headerTitleLabel.font = uiConfig.boldFont(size: 20)
            
            cell.bottomBorderView.backgroundColor = uiConfig.hairlineColor
            
            cell.backgroundColor = uiConfig.mainThemeBackgroundColor
            cell.containerView.backgroundColor = .clear
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return CardHeaderCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is CardHeaderModel else { return .zero }
        return CGSize(width: containerBounds.width, height: 70)
    }
}
