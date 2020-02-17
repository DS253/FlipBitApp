//
//  ViewControllerContainerRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class ViewControllerContainerRowAdapter: GenericCollectionRowAdapter {
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? ViewControllerContainerViewModel,
            let cell = cell as? ATCViewControllerContainerCollectionViewCell else { return }
        cell.configure(viewModel: viewModel)
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return ATCViewControllerContainerCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let viewModel = object as? ViewControllerContainerViewModel else { return .zero }
        var height: CGFloat
        if let cellHeight = viewModel.cellHeight {
            height = cellHeight
        } else if let collectionVC = viewModel.viewController as? GenericCollectionViewController,
            let dataSource = collectionVC.genericDataSource,
            let subcellHeight = viewModel.subcellHeight {
            height = CGFloat(dataSource.numberOfObjects()) * subcellHeight
        } else {
            if let collectionVC = viewModel.viewController as? GenericCollectionViewController, let flow = collectionVC.collectionViewLayout as? UICollectionViewFlowLayout {
                let size = flow.collectionViewContentSize
                height = size.height
            } else {
                fatalError("Please provide a mechanism to compute the cell height")
            }
        }
        height = max(viewModel.minTotalHeight, height)
        return CGSize(width: containerBounds.width, height: height)
    }
}
