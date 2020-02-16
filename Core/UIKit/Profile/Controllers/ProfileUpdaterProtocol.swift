//
//  ProfileUpdaterProtocol.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

protocol ProfileUpdaterProtocol: class {
    func removePhoto(url: String, user: ATCUser, completion: @escaping () -> Void)
    func uploadPhoto(image: UIImage, user: ATCUser, isProfilePhoto: Bool, completion: @escaping () -> Void)
    func update(user: ATCUser,
                email: String,
                firstName: String,
                lastName: String,
                username: String,
                completion: @escaping (_ success: Bool) -> Void)
    func updateLocation(for user: ATCUser, to location: Location, completion: @escaping (_ success: Bool) -> Void)
}
