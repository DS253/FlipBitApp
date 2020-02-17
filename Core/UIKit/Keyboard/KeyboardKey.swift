//
//  KeyboardKey.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class KeyboardKey: GenericBaseModel {
    var value: String
    var displayValue: String
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    init(value: String, displayValue: String) {
        self.value = value
        self.displayValue = displayValue
    }
    
    var description: String {
        return displayValue
    }
}
