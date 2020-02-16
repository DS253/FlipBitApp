//
//  BarChart.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Charts
import UIKit

class BarChartGroup: GenericBaseModel {
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

class BarChart: GenericBaseModel {
    let groups: [BarChartGroup]
    let labels: [String]
    let name: String
    let valueFormat: String
    
    init(groups: [BarChartGroup], name: String, labels: [String], valueFormat: String) {
        self.groups = groups
        self.valueFormat = valueFormat
        self.name = name
        self.labels = labels
    }
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    var description: String {
        return ""
    }
}
