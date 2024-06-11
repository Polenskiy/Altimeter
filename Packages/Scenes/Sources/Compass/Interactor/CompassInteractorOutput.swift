//
//
//
//  CompassTestInteractorOutput.swift
//	Where my children
//

import CoreLocation

protocol CompassInteractorOutput: AnyObject {
    func update(heading: CLHeading)
}
