//
//  ATCSelectFilter.swift
//  ListingApp
//
//  Created by Florian Marcu on 6/16/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import UIKit

struct ATCFilterOption {
    var id: String
    var name: String
}

class ATCSelectFilter: GenericBaseModel {
    var id: String
    var options: [ATCFilterOption]
    var title: String
    var categoryId: String?
    var selectedOption: ATCFilterOption?

    init(id: String, title: String, options: [ATCFilterOption], categoryId: String? = nil) {
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

        var options: [ATCFilterOption] = [ATCFilterOption(id: "all_id", name: "All")]
        for optionStr in (jsonDict["options"] as? [String] ?? []) {
            options.append(ATCFilterOption(id: "firebase_option_id", name: optionStr))
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
