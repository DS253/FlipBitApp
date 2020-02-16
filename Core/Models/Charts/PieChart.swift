//
//  PieChart.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Charts
import UIKit

class PieChart: GenericBaseModel {
    let entries: [PieChartDataEntry]
    let name: String
    let descriptionText: String?
    let format: String
    
    init(entries: [PieChartDataEntry], name: String, format: String, descriptionText: String? = nil) {
        self.entries = entries
        self.name = name
        self.descriptionText = descriptionText
        self.format = format
    }
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    var description: String {
        return name
    }
}
