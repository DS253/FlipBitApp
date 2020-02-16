//
//  ATCDividerRowAdapter.swift
//  RestaurantApp
//
//  Created by Florian Marcu on 5/19/18.
//  Copyright © 2018 iOS App Templates. All rights reserved.
//

import UIKit

class ATCDividerRowAdapter: GenericCollectionRowAdapter {
    let titleFont: UIFont
    let minHeight: CGFloat
    let titleColor: UIColor

    init(titleFont: UIFont,
         minHeight: CGFloat = 70,
         titleColor: UIColor = .black) {
        self.titleFont = titleFont
        self.minHeight = minHeight
        self.titleColor = titleColor
    }

    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let divider = object as? ATCDivider, let cell = cell as? ATCDividerCollectionViewCell {
            cell.dividerLabel.text = divider.title
            cell.dividerLabel.font = titleFont
            cell.dividerLabel.textColor = titleColor
            cell.containerView.backgroundColor = .clear
            cell.backgroundColor = .clear
        }
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCDividerCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCDivider else { return .zero }
        let width = containerBounds.width
        var height = minHeight
        if let text = viewModel.title {
            height = text.height(withConstrainedWidth: width, font: self.titleFont) + 12.0
        }
        return CGSize(width: width, height: max(height, minHeight))
    }
}
