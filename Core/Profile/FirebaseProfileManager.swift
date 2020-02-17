//
//  FirebaseProfileManager.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FirebaseProfileManager : ProfileManager {
    let db = Firestore.firestore()
    var usersListener: ListenerRegistration? = nil
    
    var delegate: ProfileManagerDelegate?
    
    func fetchProfile(for user: ATCUser) {
        //...
    }
    
    func update(profile: ATCUser, email: String, firstName: String, lastName: String, phone: String) {
        let documentRef = db.collection("users").document("\(profile.uid!)")
        
        documentRef.updateData([
            "firstName" : firstName,
            "lastName"  : lastName,
            "email"     : email,
            "phone"     : phone,
            "userID"    : profile.uid!
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
                self.delegate?.profileEditManager(self, didUpdateProfile: false)
            } else {
                print("Successfully updated")
                profile.firstName = firstName
                profile.lastName = lastName
                profile.email = email
                self.delegate?.profileEditManager(self, didUpdateProfile: true)
            }
        }
    }
}
