//
//  GenericLocalDataSource.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

class GenericLocalDataSource<T: GenericBaseModel>: GenericCollectionViewControllerDataSource {
    weak var delegate: GenericCollectionViewControllerDataSourceDelegate?
    
    var items: [T]
    
    init(items: [T]) {
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
    
    func update(items: [T]) {
        self.items = items
        self.delegate?.genericCollectionViewControllerDataSource(self, didLoadFirst: items)
    }
}
