//
//  TopLinedPageCarouselRowAdapter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class TopLinedPageCarouselRowAdapter: GenericCollectionRowAdapter {
    
    func configure(cell: UICollectionViewCell, with object: GenericBaseModel) {
        guard let viewModel = object as? InstaLinedPageCarouselViewModel, let cell = cell as? InstaTopLinedPageCarouselCollectionViewCell else { return }
        cell.carouselContainerView.setNeedsLayout()
        cell.carouselContainerView.layoutIfNeeded()
        
        let viewController = viewModel.viewController
        
        if let dS = viewController.genericDataSource {
            cell.linePageControl.numberOfPages = dS.numberOfObjects()
        }
        viewController.scrollDelegate = cell
        
        viewController.view.frame = cell.carouselContainerView.bounds
        cell.carouselContainerView.addSubview(viewController.view)
        cell.setNeedsLayout()
        viewModel.parentViewController?.addChild(viewModel.viewController)
    }
    
    func cellClass() -> UICollectionViewCell.Type {
        return InstaTopLinedPageCarouselCollectionViewCell.self
    }
    
    func size(containerBounds: CGRect, object: GenericBaseModel) -> CGSize {
        guard let viewModel = object as? InstaLinedPageCarouselViewModel else { return .zero }
        return CGSize(width: containerBounds.width, height: viewModel.cellHeight)
    }
}
