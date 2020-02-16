//
//  LandingScreenViewModel.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Foundation

struct LandingScreenViewModel {
    let imageIcon: String
    let title: String
    let subtitle: String
    let loginString: String
    let signUpString: String
}

struct LoginScreenViewModel {
    let contactPointField: String
    let passwordField: String
    let title: String
    let loginString: String
    let facebookString: String
    let separatorString: String
}

struct SignUpScreenViewModel {
    let nameField: String
    let phoneField: String
    let emailField: String
    let passwordField: String
    let title: String
    let signUpString: String
}
