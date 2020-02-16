//
//  CardFooterModel.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class CardFooterModel: GenericBaseModel {
    var title: String
    
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    init(title: String) {
        self.title = title
    }
    
    var description: String {
        return title
    }
}
