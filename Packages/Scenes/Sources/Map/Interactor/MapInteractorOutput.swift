//
//
//
//  MapTestInteractorOutput.swift
//	Where my children
//
import CoreLocation

protocol MapInteractorOutput: AnyObject {
    func didUpdate(location: CLLocation)
}
