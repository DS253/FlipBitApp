//
//  SearchBar.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class SearchBar: GenericBaseModel {
    var placeholder: String
    
    init(placeholder: String) {
        self.placeholder = placeholder
    }
    required init(jsonDict: [String: Any]) {
        fatalError()
    }
    var description: String {
        return "searchbar"
    }
}
