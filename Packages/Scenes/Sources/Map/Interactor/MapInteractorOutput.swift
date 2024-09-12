//
//
//
//  MapTestInteractorOutput.swift
//	Where my children
//
import CoreLocation
import CoreMotion

protocol MapInteractorOutput: AnyObject {
    
//    func didUpdateLocation(location: CLLocation, barometer: CMAltitudeData)
    
    //TODO: - сделать два раздельных метода обновления данных
    func didUpdate(location: CLLocation)
    func didUpdate(barometer: CMAltitudeData)
    
}
