//
//  BarometerListener.swift
//  Altimeter
//
//  Created by Daniil Polenskii on 10.09.2024.
//

import CoreMotion

public protocol BarometerListenerProtocol {
    func startUpdatingLocation(handler: @escaping ((CMAltitudeData?, Error?) -> Void))
    func stopUpdatingHandler()
}

public final class BarometerListener: NSObject, BarometerListenerProtocol {
    private let altimeter = CMAltimeter()
    private var barometerHandler: ((CMAltitudeData?, Error?) -> ())?
    
    public func startUpdatingLocation(handler: @escaping ((CMAltitudeData?, Error?) -> Void)) {
        self.barometerHandler = handler
        
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { [weak self] data, error in
                self?.barometerHandler?(data, error)
            }
        } else {
            
        }
    }
    
    public func stopUpdatingHandler() {
        altimeter.stopRelativeAltitudeUpdates()
        self.barometerHandler = nil
    }
}
