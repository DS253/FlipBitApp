//
//  FacebookPost.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

class FacebookPost: GenericBaseModel {
    var description: String {
        return ""
    }
    
    var link: String?
    var createdTime: String?
    var picture: String?
    var name: String?
    
    required init(jsonDict: [String: Any]) {
        //        link            <- map["link"]
        //        createdTime     <- map["created_time"]
        //        description     <- map["description"]
        //        name            <- map["name"]
        //        picture         <- map["picture"]
    }
}
