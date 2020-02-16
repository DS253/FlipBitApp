//
//  FinanceInstitutionRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class FinanceInstitutionRowAdapter: GenericCollectionRowAdapter {
    var uiConfig: UIGenericConfigurationProtocol
    weak var delegate: AddBankAccountButtonRowAdapterDelegate?
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        if let institution = object as? FinanceInstitution, let cell = cell as? FinanceInstitutionCollectionViewCell {
            cell.imageView.kf.setImage(with: URL(string: institution.imageUrl))
            cell.imageView.contentMode = .scaleToFill
            cell.imageView.layer.cornerRadius = 60 / 2
            cell.imageView.clipsToBounds = true
            
            cell.titleLabel.text = institution.title
            cell.titleLabel.textColor = uiConfig.mainSubtextColor
            cell.titleLabel.font = uiConfig.regularFont(size: 14)
            
            cell.backgroundColor = uiConfig.mainThemeBackgroundColor
            cell.containerView.backgroundColor = .clear
        }
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return FinanceInstitutionCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard object is FinanceInstitution else { return .zero }
        return CGSize(width: containerBounds.width / 3, height: 120)
    }
}

