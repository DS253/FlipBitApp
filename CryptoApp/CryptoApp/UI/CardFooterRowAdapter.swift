//
//  CardFooterRowAdapter.swift
//  FinanceApp
//
//  Created by Florian Marcu on 3/16/19.
//  Copyright © 2019 Instamobile. All rights reserved.
//

import UIKit

class CardFooterRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let footer = object as? CardFooterModel, let cell = cell as? CardFooterCollectionViewCell {
            cell.footerTitleLabel.text = footer.title
            cell.footerTitleLabel.textColor = uiConfig.mainSubtextColor
            cell.footerTitleLabel.font = uiConfig.boldFont(size: 15)

            cell.footerImageView.image = UIImage.localImage("forward-arrow-black", template: true)
            cell.footerImageView.tintColor = uiConfig.mainSubtextColor
            cell.footerImageView.alpha = 0.9

            cell.backgroundColor = uiConfig.mainThemeBackgroundColor
            cell.containerView.backgroundColor = .clear
        }
    }

    func cellClass() -> UICollectionViewCell.Type {
        return CardFooterCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let viewModel = object as? CardFooterModel else { return .zero }
        return CGSize(width: containerBounds.width, height: 70)
    }
}
