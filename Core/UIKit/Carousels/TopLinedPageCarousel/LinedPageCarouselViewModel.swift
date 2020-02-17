//
//  LinedPageCarouselViewModel.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class LinedPageCarouselViewModel: GenericBaseModel {
    var description: String = "LinedPageCarouselViewModel"
    
    let cellHeight: CGFloat
    var viewController: ATCGenericCollectionViewController
    weak var parentViewController: UIViewController?
    
    init(viewController: ATCGenericCollectionViewController, cellHeight: CGFloat) {
        self.cellHeight = cellHeight
        self.viewController = viewController
    }
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
}