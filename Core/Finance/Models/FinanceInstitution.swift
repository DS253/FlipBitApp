//
//  FinanceInstitution.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class FinanceInstitution: GenericBaseModel {
    var title: String
    var imageUrl: String
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    init(title: String, imageUrl: String) {
        self.title = title
        self.imageUrl = imageUrl
    }
    
    var description: String {
        return title
    }
}
