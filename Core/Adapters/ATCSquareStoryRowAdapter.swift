//
//  ATCSquareStoryRowAdapter.swift
//  ListingApp
//
//  Created by Florian Marcu on 6/9/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import UIKit

class ATCSquareStoryRowAdapter: GenericCollectionRowAdapter {
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
