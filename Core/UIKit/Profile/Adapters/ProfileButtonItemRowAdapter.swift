//
//  ProfileButtonItemRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class ProfileButtonItemRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? ProfileButtonItem, let cell = cell as? ATCProfileButtonCollectionViewCell else { return }
        cell.button.setTitle(viewModel.title, for: .normal)
        cell.button.configure(tintColor: viewModel.textColor ?? uiConfig.mainThemeBackgroundColor,
                              font: uiConfig.boldFont(size: 18.0),
                              bgColor: viewModel.color ?? uiConfig.mainThemeBackgroundColor,
                              borderColor: .clear,
                              borderWidth: 0.0,
                              cornerRadius: 8)
        cell.button.isUserInteractionEnabled = false
        cell.containerView.backgroundColor = uiConfig.mainThemeBackgroundColor
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCProfileButtonCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let _ = object as? ProfileButtonItem else { return .zero }
        return CGSize(width: containerBounds.width, height: 65.0)
    }
}
