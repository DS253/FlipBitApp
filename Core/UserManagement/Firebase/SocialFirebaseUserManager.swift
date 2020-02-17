//
//  SocialFirebaseUserManager.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import FirebaseFirestore
import UIKit

class SocialFirebaseUserManager: SocialUserManagerProtocol {
    func fetchUser(userID: String, completion: @escaping (_ user: ATCUser?) -> Void) {
        let usersRef = Firestore.firestore().collection("users").whereField("userID", isEqualTo: userID)
        usersRef.getDocuments { (querySnapshot, error) in
            if error != nil {
                return
            }
            guard let querySnapshot = querySnapshot else {
                return
            }
            if let document = querySnapshot.documents.first {
                let data = document.data()
                let user = ATCUser(representation: data)
                completion(user)
            } else {
                completion(nil)
            }
        }
    }
}
