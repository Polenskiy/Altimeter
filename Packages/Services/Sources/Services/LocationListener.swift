//
//  LocationListener.swift
//
//
//  Created by Vladimir Romashov on 17.05.2024.
//

import Foundation
import CoreLocation

public protocol LocationListenerProtocol {
    func startUpdatingLocation(handler: ((CLLocation?) -> Void)?)
    func stopUpdatingLocation()
    func startUpdatingHeading(handler: ((CLHeading) -> Void)?)
    func stopUpdatingHeading()
    func getLocation() -> CLLocation?
}

public final class LocationListener: NSObject, LocationListenerProtocol {
    private let locationManager = CLLocationManager()
    private var locationHandler: ((CLLocation?) -> Void)?
    private var headingHandler: ((CLHeading) -> Void)?
    
    public func startUpdatingLocation(handler: ((CLLocation?) -> Void)?) {
        self.locationHandler = handler
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationHandler?(locationManager.location)
    }
    
    public func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        locationHandler = nil
    }
    
    public func startUpdatingHeading(handler: ((CLHeading) -> Void)?) {
        self.headingHandler = handler
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
        if let heading = locationManager.heading {
            headingHandler?(heading)
        }
    }
    
    public func stopUpdatingHeading() {
        locationManager.stopUpdatingHeading()
        headingHandler = nil
    }
    
    public func getLocation() -> CLLocation? {
        locationManager.location
    }
}

extension LocationListener: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationHandler?(locations.last)
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        headingHandler?(newHeading)
    }
}
