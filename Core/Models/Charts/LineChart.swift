//
//  LineChart.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Charts
import UIKit

class LineChart: GenericBaseModel {
    let numbers: [Double]
    let name: String
    
    init(numbers: [Double], name: String) {
        self.numbers = numbers
        self.name = name
    }
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    var description: String {
        return ""
    }
}
