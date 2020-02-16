//
//  Notification.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class NotificationModel: GenericBaseModel {
    var category: String
    var content: String
    var icon: String
    var isNotSeen: Bool
    var createdAt: Date
    
    init(category: String, content: String, icon: String, isNotSeen: Bool, createdAt: Date) {
        self.category = category
        self.content = content
        self.icon = icon
        self.isNotSeen = isNotSeen
        self.createdAt = createdAt
    }
    
    required public init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    var description: String {
        return content
    }
}
