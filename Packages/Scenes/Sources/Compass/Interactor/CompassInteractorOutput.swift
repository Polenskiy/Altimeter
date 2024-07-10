//
//
//
//  CompassTestInteractorOutput.swift
//	Where my children
//

import CoreLocation

protocol CompassInteractorOutput: AnyObject {
    func didUpdate(heading: CLHeading)
    func didUpdate(location: CLLocation)
}
