//
//  ATCAPIManager.swift
//  AppTemplatesCore
//
//  Created by Florian Marcu on 2/2/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

public class ATCAPIManager {

    fileprivate let networkingManager = ATCNetworkingManager()

    func retrieveObjectFromJSON<T: GenericJSONParsable>(urlPath: String, parameters: [String : String]?, completion: @escaping (_ object: T?, _ status: NetworkResponseStatus) -> Void) {
        networkingManager.getJSONResponse(path: urlPath, parameters: parameters) { (jsonData: Any?, status: NetworkResponseStatus) in
            if let jsonDict = jsonData as? [String: Any] {
                completion(T(jsonDict: jsonDict), status)
            } else {
                completion(nil, status)
            }
        }
    }

    func retrieveListFromJSON<T: GenericJSONParsable>(urlPath: String, parameters: [String : String]?, completion: @escaping (_ objects: [T]?, _ status: NetworkResponseStatus) -> Void) {
        networkingManager.getJSONResponse(path: urlPath, parameters: parameters) { (jsonData: Any?, status: NetworkResponseStatus) in
            if let jsonArray = jsonData as? [[String: Any]] {
                completion(jsonArray.compactMap{T(jsonDict: $0)}, status)
            } else {
                completion(nil, status)
            }
        }
    }
}
