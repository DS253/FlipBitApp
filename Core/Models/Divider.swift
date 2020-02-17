//
//  Divider.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class Divider: GenericBaseModel {
    
    var title: String?
    
    convenience init(_ title: String? = nil) {
        self.init(jsonDict: [:])
        self.title = title
    }
    
    required init(jsonDict: [String: Any]) { }
    var description: String {
        return "divider"
    }
}
