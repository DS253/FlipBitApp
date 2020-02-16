//
//  SelectFilter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

struct FilterOption {
    var id: String
    var name: String
}

class SelectFilter: GenericBaseModel {
    var id: String
    var options: [FilterOption]
    var title: String
    var categoryId: String?
    var selectedOption: FilterOption?
    
    init(id: String, title: String, options: [FilterOption], categoryId: String? = nil) {
        self.id = id
        self.options = options
        self.title = title
        self.categoryId = categoryId
        if let first = options.first {
            self.selectedOption = first
        }
    }
    
    required init(jsonDict: [String: Any]) {
        self.id = jsonDict["id"] as? String ?? ""
        self.title = jsonDict["name"] as? String ?? ""
        self.categoryId = jsonDict["category"] as? String
        
        var options: [FilterOption] = [FilterOption(id: "all_id", name: "All")]
        for optionStr in (jsonDict["options"] as? [String] ?? []) {
            options.append(FilterOption(id: "firebase_option_id", name: optionStr))
        }
        self.options = options
        if let first = options.first {
            self.selectedOption = first
        }
    }
    
    var description: String {
        return self.id
    }
}
