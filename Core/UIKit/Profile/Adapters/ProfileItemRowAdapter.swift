//
//  ProfileItemRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class ProfileItemRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? ProfileItem, let cell = cell as? ATCProfileItemCollectionViewCell else { return }
        cell.iconImageView.image = viewModel.icon
        cell.iconImageView.tintColor = viewModel.color
        cell.iconImageView.contentMode = .scaleAspectFill
        
        cell.itemTitleLabel.text = viewModel.title
        cell.itemTitleLabel.font = uiConfig.regularFont(size: 16.0)
        
        switch viewModel.type {
        case .arrow:
            cell.accessoryImageView.image = UIImage.localImage("forward-arrow-black", template: true)
            cell.accessoryImageView.tintColor = UIColor(hexString: "#DBDBDE")
        default:
            cell.accessoryImageView.image = nil
        }
        
        cell.containerView.backgroundColor = uiConfig.mainThemeBackgroundColor
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCProfileItemCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let _ = object as? ProfileItem else { return .zero }
        return CGSize(width: containerBounds.width, height: 50.0)
    }
}
