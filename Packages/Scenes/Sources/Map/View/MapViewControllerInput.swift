//
//
//
//  MapViewControllerInput.swift
//	Where my children
//
import CoreLocation

protocol MapViewControllerInput: BaseViewControllerInput {
    func updateData(with viewModel: MapViewController.MapInformationViewModel)
    func updateData(with location: CLLocation)
}
