//
//  SquareStoryRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class SquareStoryRowAdapter: GenericCollectionRowAdapter {
    let uiConfig: UIGenericConfigurationProtocol
    
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? ATCStoryViewModel, let cell = cell as? ATCSquareStoryCollectionViewCell else { return }
        cell.configure(uiConfig: uiConfig, viewModel: viewModel)
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCSquareStoryCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        return CGSize(width: 120, height: 125)
    }
}
