//
//  DateRangeAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class DateRangeAdapter: GenericCollectionRowAdapter {
    
    let uiConfig: UIGenericConfigurationProtocol
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let dateRangeModel = object as? DateRangeModel,
            let cell = cell as? ATCDateRangeCollectionViewCell {
            let caretImage = UIImage.localImage("caret-icon", template: true)
            cell.calendarImageView.image = caretImage
            cell.calendarImageView.tintColor = uiConfig.mainSubtextColor
            
            cell.dateRangeLabel.text = dateRangeModel.timePeriodText
            cell.dateRangeTitleLabel.text = dateRangeModel.titleText
            
            cell.dateRangeTitleLabel.font = uiConfig.boldLargeFont
            cell.dateRangeTitleLabel.textColor = uiConfig.mainTextColor
            
            cell.dateRangeLabel.font = uiConfig.regularMediumFont
            cell.dateRangeLabel.textColor = uiConfig.mainSubtextColor
            cell.setNeedsLayout()
            
            cell.hairlineView.backgroundColor = uiConfig.hairlineColor
            cell.hairlineViewTop.backgroundColor = uiConfig.hairlineColor
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCDateRangeCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let _ = object as? DateRangeModel else { return .zero }
        return CGSize(width: containerBounds.width, height: 50)
    }
}
