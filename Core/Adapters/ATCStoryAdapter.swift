//
//  ATCStoryAdapter.swift
//  RestaurantApp
//
//  Created by Florian Marcu on 5/15/18.
//  Copyright © 2018 iOS App Templates. All rights reserved.
//

import UIKit

class ATCStoryAdapter: GenericCollectionRowAdapter {
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
