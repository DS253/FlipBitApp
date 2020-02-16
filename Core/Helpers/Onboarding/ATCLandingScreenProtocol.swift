//
//  ATCLoginScreenProtocol.swift
//  DashboardApp
//
//  Created by Florian Marcu on 8/8/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import UIKit

protocol ATCLandingScreenDelegate: class {
    func landingScreenDidLoadView(_ landingScreen: ATCLandingScreenProtocol)
}

protocol ATCLoginScreenDelegate: class {
    func loginScreenDidLoadView(_ loginScreen: ATCLoginScreenProtocol)
    func loginScreen(_ loginScreen: ATCLoginScreenProtocol,
                     didFetchAppleUserWith firstName: String?,
                     lastName: String?,
                     email: String?,
                     password: String)
}

protocol ATCSignUpScreenDelegate: class {
    func signUpScreenDidLoadView(_ signUpScreen: ATCSignUpScreenProtocol)
}

protocol ATCLandingScreenProtocol {
    var logoImageView: UIImageView! {get}
    var titleLabel: UILabel! {get}
    var subtitleLabel: UILabel! {get}
    var loginButton: UIButton! {get}
    var signUpButton: UIButton! {get}
    var delegate: ATCLandingScreenDelegate? {get set}
}

protocol ATCLoginScreenProtocol {
    var titleLabel: UILabel! {get}
    var contactPointTextField: FlipBitTextField! {get}
    var passwordTextField: FlipBitTextField! {get}
    var separatorLabel: UILabel! {get}
    var loginButton: UIButton! {get}
    var facebookButton: UIButton! {get}
    var view: UIView! {get}
    func display(alertController: UIAlertController)
}

protocol ATCSignUpScreenProtocol {
    var titleLabel: UILabel! {get}
    var backButton: UIButton! {get}
    var nameTextField: FlipBitTextField! {get}
    var phoneNumberTextField: FlipBitTextField! {get}
    var emailTextField: FlipBitTextField! {get}
    var passwordTextField: FlipBitTextField! {get}
    var errorLabel: UILabel! {get}
    var signUpButton: UIButton! {get}
    var view: UIView! {get}
    func display(alertController: UIAlertController)
}
