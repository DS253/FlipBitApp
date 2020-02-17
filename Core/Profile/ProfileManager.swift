//
//  ProfileManager.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol ProfileManagerDelegate: class {
    func profileEditManager(_ manager: ProfileManager, didFetch user: ATCUser) -> Void
    func profileEditManager(_ manager: ProfileManager, didUpdateProfile success: Bool) -> Void
}

protocol ProfileManager: class {
    var delegate: ProfileManagerDelegate? {get set}
    func fetchProfile(for user: ATCUser) -> Void
    func update(profile: ATCUser,
                email: String,
                firstName: String,
                lastName: String,
                phone: String) -> Void
}
