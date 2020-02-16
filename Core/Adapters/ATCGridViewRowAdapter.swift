//
//  ATCGridViewRowAdapter.swift
//  ListingApp
//
//  Created by Florian Marcu on 6/9/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import UIKit

class ATCGridViewRowAdapter: GenericCollectionRowAdapter {
    let uiConfig: UIGenericConfigurationProtocol

    init(uiConfig: UIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? ATCGridViewModel, let cell = cell as? ATCGridCollectionViewCell else { return }
        cell.configure(viewModel: viewModel, uiConfig: self.uiConfig)
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCGridCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCGridViewModel else { return .zero }
        return CGSize(width: containerBounds.width, height: viewModel.cellHeight)
    }
}
