//
//  AddBankAccountModel.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class AddBankAccountModel: ATCGenericBaseModel {
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    
    init() {}
    
    var description: String {
        return "bank account button"
    }
}
