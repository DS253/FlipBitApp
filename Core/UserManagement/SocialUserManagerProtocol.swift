//
//  SocialUserManagerProtocol.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

let kATCLoggedInUserDataDidChangeNotification = Notification.Name("kATCLoggedInUserDataDidChangeNotification")

protocol SocialUserManagerProtocol: class {
    func fetchUser(userID: String, completion: @escaping (_ user: ATCUser?) -> Void)
}
