//
//
//
//  MapTestInteractorOutput.swift
//	Where my children
//
import CoreLocation
import CoreMotion

protocol MapInteractorOutput: AnyObject {
    func didUpdate(location: CLLocation)
    func didUpdate(barometer: CMAltitudeData)
}
