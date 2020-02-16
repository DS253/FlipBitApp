//
//  RemoteHostContextProvider.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

public protocol RemoteHostContextProvider {
    func urlEndpointPath() -> String?
}
