//
//  ATCSelectFilterRowAdapter.swift
//  ListingApp
//
//  Created by Florian Marcu on 6/16/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import UIKit

class ATCSelectFilterRowAdapter: GenericCollectionRowAdapter {
    let titleFont: UIFont?
    let optionFont: UIFont?
    let titleColor: UIColor
    let bgColor: UIColor
    var height: CGFloat

    init(titleFont: UIFont? = nil,
         titleColor: UIColor = UIColor(hexString: "#454545"),
         bgColor: UIColor,
         optionFont: UIFont? = nil,
         height: CGFloat = 70) {
        self.titleFont = titleFont
        self.bgColor = bgColor
        self.optionFont = optionFont
        self.height = height
        self.titleColor = titleColor
    }

    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let filter = object as? SelectFilter, let cell = cell as? ATCSelectFilterCollectionViewCell {
            cell.filterNameLabel.text = filter.title
            cell.selectedOptionLabel.text = filter.selectedOption?.name
            cell.cellContainerView.addBorder(side: .bottom, thickness: 0.5, color: UIColor(hexString: "#e6e6e6"))
            cell.filterNameLabel.textColor = self.titleColor
            cell.selectedOptionLabel.textColor = .gray
            if let titleFont = titleFont {
                cell.filterNameLabel.font = titleFont
            }
            if let optionFont = optionFont {
                cell.selectedOptionLabel.font = optionFont
            }
            cell.cellContainerView.backgroundColor = bgColor
            cell.backgroundColor = bgColor
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCSelectFilterCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        return CGSize(width: containerBounds.width, height: height)
    }
}
