//
//  LocationManager.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

import CoreLocation
import UIKit

protocol LocationManagerDelegate: class {
    func locationManager(_ locationManager: LocationManager, didReceive location: Location)
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager: CLLocationManager
    weak var delegate: LocationManagerDelegate?
    
    override init() {
        manager = CLLocationManager()
        super.init()
        manager.delegate = self
        manager.distanceFilter = kCLDistanceFilterNone
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestWhenInUsePermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let clLocation = locations.first {
            let location = Location(longitude: clLocation.coordinate.longitude,
                                    latitude: clLocation.coordinate.latitude)
            delegate?.locationManager(self, didReceive: location)
        }
    }
}
