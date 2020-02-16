//
//  ExpenseCategory.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class ExpenseCategory: GenericBaseModel {
    var title: String
    var color: String
    var logoURL: String
    var spending: String
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    init(title: String,
         color: String,
         logoURL: String,
         spending: String) {
        self.title = title
        self.color = color
        self.logoURL = logoURL
        self.spending = spending
    }
    
    var description: String {
        return title
    }
}
