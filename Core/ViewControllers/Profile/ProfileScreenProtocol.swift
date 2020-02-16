//
//  ProfileScreenProtocol.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

struct ProfileScreenConfiguration {
    var viewer: ATCUser
    var viewee: ATCUser
    var messageButtonAction: ((_ viewer: ATCUser, _ viewee: ATCUser) -> Void)?
    var followButtonAction: ((_ viewer: ATCUser, _ viewee: ATCUser) -> Void)?
}

protocol ProfileScreenPresenterProtocol: class {
    func presentProfileScreen(viewController: UIViewController, user: ATCUser) -> Void
}

protocol ProfileScreenProtocol: class {
    var configuration: ProfileScreenConfiguration {get}
}
