//
//  GenericLocalHeteroDataSource.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class GenericLocalHeteroDataSource: ATCGenericCollectionViewControllerDataSource {
    weak var delegate: ATCGenericCollectionViewControllerDataSourceDelegate?
    
    let items: [GenericBaseModel]
    
    init(items: [GenericBaseModel]) {
        self.items = items
    }
    
    func object(at index: Int) -> GenericBaseModel? {
        if index < items.count {
            return items[index]
        }
        return nil
    }
    
    func numberOfObjects() -> Int {
        return items.count
    }
    
    func loadFirst() {
        self.delegate?.genericCollectionViewControllerDataSource(self, didLoadFirst: items)
    }
    
    func loadBottom() {
    }
    
    func loadTop() {
    }
}
