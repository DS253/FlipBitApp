//
//  CardViewControllerContainerCollectionViewCell.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/17/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class CardViewControllerContainerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    func configure(viewModel: ViewControllerContainerViewModel) {
        containerView.dropShadow()
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
        containerView.setNeedsLayout()
        containerView.layoutIfNeeded()
        self.backgroundColor = .clear
        
        let viewController = viewModel.viewController
        
        viewController.view.frame = containerView.bounds
        containerView.addSubview(viewController.view)
        self.setNeedsLayout()
        viewModel.parentViewController?.addChild(viewModel.viewController)
    }
}
