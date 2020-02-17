//
//  StoryAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class StoryAdapter: GenericCollectionRowAdapter {
    let uiConfig: UIGenericConfigurationProtocol
    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? ATCStoryViewModel, let cell = cell as? ATCStoryCollectionViewCell else { return }
        cell.configure(viewModel: viewModel, uiConfig: uiConfig)
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCStoryCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
