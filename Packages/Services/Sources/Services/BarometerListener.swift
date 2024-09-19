//
//  BarometerListener.swift
//  Altimeter
//
//  Created by Daniil Polenskii on 10.09.2024.
//

import CoreMotion

public protocol BarometerListenerProtocol {
    func startUpdatingBarometer(handler: @escaping ((CMAltitudeData?, Error?) -> Void))
    func stopUpdatingHandler()
}

public final class BarometerListener: NSObject, BarometerListenerProtocol {
    private let altimeter = CMAltimeter()
    
    public func startUpdatingBarometer(handler: @escaping ((CMAltitudeData?, Error?) -> Void)) {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { data, error in
                handler(data, error)
            }
        } else {
            
        }
    }
    
    public func stopUpdatingHandler() {
        altimeter.stopRelativeAltitudeUpdates()
//        self.barometerHandler = nil
    }
}
