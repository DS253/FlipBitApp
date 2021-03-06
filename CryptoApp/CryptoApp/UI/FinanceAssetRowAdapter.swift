//
//  FinanceAssetRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class FinanceAssetRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let asset = object as? FinanceAsset, let cell = cell as? FinanceAssetCollectionViewCell {
            cell.assetImageView.kf.setImage(with: URL(string: asset.logoURL))
            cell.assetImageView.contentMode = .scaleAspectFill
            cell.assetImageView.tintColor = .white
            cell.assetImageView.backgroundColor = UIColor(hexString: asset.color)
            cell.assetImageView.layer.cornerRadius = 30 / 2
            cell.assetImageView.clipsToBounds = true
            
            cell.assetTitleLabel.text = asset.title
            cell.assetTitleLabel.textColor = uiConfig.mainTextColor
            cell.assetTitleLabel.font = uiConfig.boldFont(size: 18)
            
            cell.assetSubtitleLabel.text = asset.ticker
            cell.assetSubtitleLabel.textColor = uiConfig.mainSubtextColor
            cell.assetSubtitleLabel.font = uiConfig.regularFont(size: 14)
            
            cell.priceChangeButton.setTitle(asset.priceChange, for: .normal)
            let hexString = asset.isPositive ? "#34956a" : "#cf676a"
            cell.priceChangeButton.configure(color: UIColor(hexString: hexString),
                                             font: uiConfig.boldFont(size: 14),
                                             cornerRadius: 15,
                                             backgroundColor: UIColor(hexString: hexString, alpha: 0.1))
            
            cell.bottomBorderView.backgroundColor = uiConfig.hairlineColor
            cell.backgroundColor = uiConfig.mainThemeBackgroundColor
            cell.containerView.backgroundColor = .clear
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return FinanceAssetCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is FinanceAsset else { return .zero }
        return CGSize(width: containerBounds.width, height: 80)
    }
}
