//
//  ProfileItem.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

public enum ProfileItemType {
    case none
    case arrow
}

public class ProfileItem: GenericBaseModel {
    var icon: UIImage?
    var title: String
    var type: ProfileItemType
    var color: UIColor
    
    init(icon: UIImage? = nil, title: String, type: ProfileItemType, color: UIColor) {
        self.icon = icon
        self.title = title
        self.type = type
        self.color = color
    }
    
    required public init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    public var description: String {
        return title
    }
}
