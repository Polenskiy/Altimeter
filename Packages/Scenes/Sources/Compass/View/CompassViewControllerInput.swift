//
//
//
//  CompassViewControllerInput.swift
//	Where my children
//
import UIKit

protocol CompassViewControllerInput: BaseViewControllerInput {
    func update(heading: CGFloat)
    
    func updateCoordinates(with coordinates: String)
    
    func updateAddress(with address: String)
}
