//
//  CardHeaderRowAdapter.swift
//  FinanceApp
//
//  Created by Florian Marcu on 3/16/19.
//  Copyright © 2019 Instamobile. All rights reserved.
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
        guard let viewModel = object as? CardHeaderModel else { return .zero }
        return CGSize(width: containerBounds.width, height: 70)
    }
}
