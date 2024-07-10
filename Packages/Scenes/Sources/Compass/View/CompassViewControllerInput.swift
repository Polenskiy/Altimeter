//
//
//
//  CompassViewControllerInput.swift
//	Where my children
//
import UIKit

protocol CompassViewControllerInput: BaseViewControllerInput {
    func update(heading: CGFloat)
    func updateLocation(with viewModel: CompassViewController.AddressViewModel)
}
