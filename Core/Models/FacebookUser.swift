//
//  FacebookUser.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

class FacebookUser: GenericBaseModel {
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var id: String?
    var profilePicture: String?
    
    var description: String {
        return firstName ?? ""
    }
    
    required init(jsonDict: [String: Any]) {
        //        firstName       <- map["first_name"]
        //        lastName        <- map["last_name"]
        //        email           <- map["email"]
        //        id              <- map["id"]
        //        profilePicture  <- map["picture.data.url"]
    }
}
