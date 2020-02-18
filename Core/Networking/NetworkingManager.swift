//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import Alamofire

public enum NetworkResponseStatus {
    case success
    case error(string: String?)
}

public class NetworkingManager {
    
    let queue = DispatchQueue(label: "networking-manager-requests", qos: .userInitiated, attributes: .concurrent)
    
    func getJSONResponse(path: String, parameters: [String:String]?, completionHandler: @escaping (_ response: Any?,_ status: NetworkResponseStatus) -> Void) {
        AF.request(path, method: .get, parameters: parameters).responseJSON(queue: queue, options: []) { (response) in
            DispatchQueue.main.async {
                if let json = response.data {
                    completionHandler(json, .success)
                } else {
                    completionHandler(nil, .error(string: response.error?.localizedDescription))
                }
            }
        }
    }
    
    func get(path: String, params: [String:String]?, completion: @escaping ((_ jsonResponse: Any?, _ responseStatus: NetworkResponseStatus) -> Void)) {
        AF.request(path, parameters: params).responseJSON { response in
            DispatchQueue.main.async {
                if let json = response.data {
                    completion(json, .success)
                } else {
                    completion(nil, .error(string: response.error?.localizedDescription))
                }
            }
        }
    }
}
