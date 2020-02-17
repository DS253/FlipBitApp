//
//  MultiRowPageCarouselViewModel.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class MultiRowPageCarouselViewModel: GenericBaseModel {
    var description: String = "MultiRowPageCarouselViewModel"
    
    let cellHeight: CGFloat
    let title: String
    var viewController: GenericCollectionViewController
    weak var parentViewController: UIViewController?
    
    init(title: String, viewController: GenericCollectionViewController, cellHeight: CGFloat) {
        self.cellHeight = cellHeight
        self.title = title
        self.viewController = viewController
    }
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
}
