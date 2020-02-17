//
//  OnboardingServerConfigurationProtocol.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol OnboardingServerConfigurationProtocol {
    var isFirebaseAuthEnabled: Bool { get }
    var appIdentifier: String { get }
}
