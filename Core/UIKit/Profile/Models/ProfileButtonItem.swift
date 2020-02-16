//
//  ProfileButtonItem.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class ProfileButtonItem: GenericBaseModel {
    var title: String
    var color: UIColor?
    var textColor: UIColor?
    
    init(title: String, color: UIColor?, textColor: UIColor?) {
        self.title = title
        self.color = color
        self.textColor = textColor
    }
    
    required public init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    public var description: String {
        return title
    }
}
