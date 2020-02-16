//
//  FinanceAssetPosition.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class FinanceAssetPosition: GenericBaseModel {
    var title: String
    var shares: Double
    var equity: String
    var portfolioDiversity: String
    var avgCost: String
    var totalReturn: String
    var todayReturn: String
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    init(title: String,
         shares: Double,
         equity: String,
         avgCost: String,
         portfolioDiversity: String,
         totalReturn: String,
         todayReturn: String) {
        self.title = title
        self.shares = shares
        self.equity = equity
        self.avgCost = avgCost
        self.portfolioDiversity = portfolioDiversity
        self.totalReturn = totalReturn
        self.todayReturn = todayReturn
    }
    
    var description: String {
        return totalReturn
    }
}
