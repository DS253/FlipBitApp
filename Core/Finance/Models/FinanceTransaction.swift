//
//  FinanceTransaction.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class FinanceTransaction: GenericBaseModel {
    var title: String
    var isPositive: Bool
    var price: String
    var imageURL: String
    var date: Date
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    init(title: String,
         isPositive: Bool,
         price: String,
         imageURL: String = "",
         date: Date) {
        self.title = title
        self.isPositive = isPositive
        self.price = price
        self.imageURL = imageURL
        self.date = date
    }
    
    var description: String {
        return title
    }
}
