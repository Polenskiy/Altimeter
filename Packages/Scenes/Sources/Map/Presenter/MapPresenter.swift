//
//
//
//  MapPresenter.swift
//	Where my children
//

import UIKit
import CoreLocation
import CoreMotion

final class MapPresenter: BasePresenter {
    
    var interactor: MapInteractorInput!
    weak var view: MapViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: MapRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - MapModuleInput
extension MapPresenter: MapModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - MapInteractorOutput
extension MapPresenter: MapInteractorOutput {
    
    func didUpdate(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placmarks, error) in
            guard let self = self, let placemark = placmarks?.first, error == nil else {
                return
            }
            
            let address = [
                placemark.thoroughfare,
                placemark.locality,
                placemark.country
            ].compactMap{ $0 }.joined(separator: ", ")
            
            let speed = String(format: "%.2f", location.speed)
            let altitude = String(format: "%.2f", location.altitude)
            let latitude = String(format: "%.2f", location.coordinate.latitude)
            let longitude = String(format: "%.2f", location.coordinate.longitude)
            
            view.updateLocation(viewModelLocation: MapViewController.InformationViewModel.Location(
                speed: speed,
                altitude: altitude,
                latitude: latitude,
                longitude: longitude,
                address: address)
            )
        }
    }

    func didUpdate(barometer: CMAltitudeData) {
        let barometerData = String(format: "%.2f", barometer.pressure.doubleValue)
        view.updateBarometer(
            viewModelBarometer: MapViewController.InformationViewModel.Barometer(
                barometer: barometerData
            )
        )
    }
}

// MARK: - MapViewControllerOutput
extension MapPresenter: MapViewControllerOutput {
    func onCompassControl() {
        router.showCompass()
    }
    func onShareControl() {
        router.navigateToShareView()
    }
}
