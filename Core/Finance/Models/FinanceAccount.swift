//
//  FinanceAccount.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class FinanceAccount: GenericBaseModel {
    var title: String
    var color: String
    var logoURL: String
    var institution: String
    var amount: String
    var isPositive: Bool
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    init(title: String,
         color: String,
         logoURL: String,
         amount: String,
         isPositive: Bool,
         institution: String) {
        self.title = title
        self.color = color
        self.logoURL = logoURL
        self.amount = amount
        self.institution = institution
        self.isPositive = isPositive
    }
    
    var description: String {
        return title
    }
}
