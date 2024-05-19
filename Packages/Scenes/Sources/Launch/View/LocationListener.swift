//
//  LocationListener.swift
//
//
//  Created by Vladimir Romashov on 17.05.2024.
//

import Foundation
import CoreLocation

final class LocationListener: NSObject {
    private let locationManager = CLLocationManager()
    private var locationHandler: ((CLLocation?) -> Void)?
    private var headingHandler: ((CLHeading) -> Void)?
    
    func startUpdatingLocation(handler: ((CLLocation?) -> Void)?) {
        self.locationHandler = handler
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationHandler?(locationManager.location)
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        locationHandler = nil
    }
    
    func startUpdatingHeading(handler: ((CLHeading) -> Void)?) {
        self.headingHandler = handler
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
        if let heading = locationManager.heading {
            headingHandler?(heading)
        }
    }
    
    func stopUpdatingHeading() {
        locationManager.stopUpdatingHeading()
        headingHandler = nil
    }
}

extension LocationListener: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationHandler?(locations.last)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        headingHandler?(newHeading)
    }
}
