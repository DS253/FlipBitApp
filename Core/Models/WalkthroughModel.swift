//
//  WalkthroughModel.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class WalkthroughModel: GenericBaseModel {
    var title: String
    var subtitle: String
    var icon: String
    
    init(title: String, subtitle: String, icon: String) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
    }
    
    required public init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    var description: String {
        return title
    }
}
