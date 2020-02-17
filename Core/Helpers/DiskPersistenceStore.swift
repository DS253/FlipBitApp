//
//  DiskPersistenceStore.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/17/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Foundation

protocol Persistable: class {
    var diffIdentifier: String {get}
}

class DiskPersistenceStore {
    private let key: String
    init(key: String) {
        self.key = key
    }
    
    func write(object: Any) {
        do {
            let res = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            UserDefaults.standard.set(res, forKey: key)
        } catch {
            print("Couldn't write to file")
        }
    }
    
    func append(object: Persistable) {
        var arrayToWrite: [Persistable] = [object]
        if let existingData = retrieve() {
            arrayToWrite = existingData + [object]
        }
        write(object: arrayToWrite)
    }
    
    func retrieve() -> [Persistable]? {
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            do {
                let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
                return unarchivedData as? [Persistable]
            } catch { return nil }
        }
        return nil
    }
    
    func remove(object: Persistable) {
        if var array = retrieve() {
            var index: NSInteger = -1
            for (idx, obj) in array.enumerated() {
                if obj.diffIdentifier == object.diffIdentifier {
                    index = idx
                }
            }
            if (index != -1) {
                array.remove(at: index)
                write(object: array)
            }
        }
    }
    
    func contains(object: Persistable) -> Bool {
        if let array = retrieve() {
            for (_, obj) in array.enumerated() {
                if obj.diffIdentifier == object.diffIdentifier {
                    return true
                }
            }
        }
        return false
    }
}
