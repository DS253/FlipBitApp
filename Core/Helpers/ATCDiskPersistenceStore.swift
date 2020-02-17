//
//  ATCDiskPersistenceStore.swift
//  ListingApp
//
//  Created by Florian Marcu on 6/19/18.
//  Copyright © 2018 Instamobile. All rights reserved.
//

import Foundation

protocol Persistable: class {
    var diffIdentifier: String {get}
}

class ATCDiskPersistenceStore {
    private let key: String
    init(key: String) {
        self.key = key
    }

    func write(object: Any) {
        let res = NSKeyedArchiver.archivedData(withRootObject: object)
        UserDefaults.standard.set(res, forKey: key)
    }

    func append(object: Persistable) {
        var arrayToWrite: [Persistable] = [object]
        if let existingData = retrieve() {
            arrayToWrite = existingData + [object]
        }
        write(object: arrayToWrite)
    }

    func retrieve() -> [Persistable]? {
        if let data = UserDefaults.standard.value(forKey: key) as? Data, let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: data) {
            return unarchivedData as? [Persistable]
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
