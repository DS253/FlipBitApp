//
//  LandingScreenProtocol.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol LandingScreenDelegate: class {
    func landingScreenDidLoadView(_ landingScreen: LandingScreenProtocol)
}

protocol LoginScreenDelegate: class {
    func loginScreenDidLoadView(_ loginScreen: LoginScreenProtocol)
    func loginScreen(_ loginScreen: LoginScreenProtocol,
                     didFetchAppleUserWith firstName: String?,
                     lastName: String?,
                     email: String?,
                     password: String)
}

protocol SignUpScreenDelegate: class {
    func signUpScreenDidLoadView(_ signUpScreen: SignUpScreenProtocol)
}

protocol LandingScreenProtocol {
    var logoImageView: UIImageView! { get }
    var titleLabel: UILabel! { get }
    var subtitleLabel: UILabel! { get }
    var loginButton: UIButton! { get }
    var signUpButton: UIButton! { get }
    var delegate: LandingScreenDelegate? { get set }
}

protocol LoginScreenProtocol {
    var titleLabel: UILabel! { get }
    var contactPointTextField: FlipBitTextField! { get }
    var passwordTextField: FlipBitTextField! { get }
    var separatorLabel: UILabel! { get }
    var loginButton: UIButton! { get }
    var facebookButton: UIButton! { get }
    var view: UIView! { get }
    func display(alertController: UIAlertController)
}

protocol SignUpScreenProtocol {
    var titleLabel: UILabel! { get }
    var backButton: UIButton! { get }
    var nameTextField: FlipBitTextField! { get }
    var phoneNumberTextField: FlipBitTextField! { get }
    var emailTextField: FlipBitTextField! { get }
    var passwordTextField: FlipBitTextField! { get }
    var errorLabel: UILabel! { get }
    var signUpButton: UIButton! { get }
    var view: UIView! { get }
    func display(alertController: UIAlertController)
}
