//
//  PersistentStore.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/17/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import UIKit

class PersistentStore {
    
    private static let kWalkthroughCompletedKey = "kWalkthroughCompletedKey"
    private static let kLoggedInUserKey = "kUserKey"
    
    func markWalkthroughCompleted() {
        UserDefaults.standard.set(true, forKey: PersistentStore.kWalkthroughCompletedKey)
    }
    
    func isWalkthroughCompleted() -> Bool {
        return UserDefaults.standard.bool(forKey: PersistentStore.kWalkthroughCompletedKey)
    }
    
    func markUserAsLoggedIn(user: ATCUser) {
        do {
            let res = try NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
            UserDefaults.standard.set(res, forKey: PersistentStore.kLoggedInUserKey)
        } catch {
            print("Couldn't write to file")
        }
    }
    
    func userIfLoggedInUser() -> ATCUser? {
        if let data = UserDefaults.standard.value(forKey: PersistentStore.kLoggedInUserKey) as? Data {
            do {
                let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
                return unarchivedData as? ATCUser
            } catch {  return nil }
        }
        return nil
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: PersistentStore.kLoggedInUserKey)
    }
}
