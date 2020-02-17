//
//  ViewControllerContainerViewModel.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class ViewControllerContainerViewModel: GenericBaseModel {
    
    var description: String = "Carousel"
    
    let cellHeight: CGFloat?
    let subcellHeight: CGFloat?
    let minTotalHeight: CGFloat
    var viewController: UIViewController
    weak var parentViewController: UIViewController?
    
    init(viewController: UIViewController,
         cellHeight: CGFloat? = nil,
         subcellHeight: CGFloat? = nil,
         minTotalHeight: CGFloat = 0) {
        self.cellHeight = cellHeight
        self.subcellHeight = subcellHeight
        self.viewController = viewController
        self.minTotalHeight = minTotalHeight
        
        if let _ = cellHeight, let _ = subcellHeight {
            fatalError("Choose either static or dynamic size. You can't have both.")
        }
    }
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
}
