//
//  FirebaseFirestoreWriter.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FirebaseFirestoreWriter {
    let tableName: String
    
    init(tableName: String) {
        self.tableName = tableName
    }
    
    func save(_ representation: [String: Any], completion: @escaping () -> Void) {
        var dictionary = representation
        let newDocRef = Firestore.firestore().collection(self.tableName).document()
        dictionary["id"] = newDocRef.documentID
        newDocRef.setData(dictionary) { (error) in
            completion()
        }
    }
}
