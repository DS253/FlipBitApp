//
//  FirebaseSearchDataSource.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import FirebaseFirestore
import UIKit

class FirebaseSearchDataSource<T: GenericSearchable & GenericBaseModel>: GenericSearchViewControllerDataSource {
    
    var viewer: ATCUser?
    weak var delegate: GenericSearchViewControllerDataSourceDelegate?
    let tableName: String
    let limit: Int?
    init(tableName: String, limit: Int? = nil) {
        self.tableName = tableName
        self.limit = limit
    }
    
    func search(text: String?) {
        let ref: Query = Firestore.firestore().collection(tableName)
        ref.getDocuments {[weak self] (querySnapshot, error) in
            guard let `self` = self else { return }
            if error != nil {
                return
            }
            guard let querySnapshot = querySnapshot else {
                return
            }
            var items: [T] = []
            let documents = querySnapshot.documents
            for document in documents {
                let data = document.data()
                items.append(T(jsonDict: data))
            }
            if let limit = self.limit {
                items = Array(items.prefix(limit))
            }
            if text != nil {
                //items = items.filter({$0.matches(keyword: text)})
            }
            self.delegate?.dataSource(self as GenericSearchViewControllerDataSource, didFetchResults: items)
        }
    }
    
    func update(completion: @escaping () -> Void) {}
}
