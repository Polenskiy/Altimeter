//
//
//
//  MapPresenter.swift
//	Where my children
//

import UIKit
import CoreLocation

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
            
            view.updateData(
                with: MapViewController.MapInformationViewModel(
                    speed: String(speed),
                    altitude: String(altitude),
                    latitude: String(latitude),
                    longitude: String(longitude),
                    barometer: String(""),
                    address: String(address)
                )
            )
        }
    }
    
    func didUpdateRegion(location: CLLocation) {
        view.updateData(with: location)
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
    
    func onPositionControl() {
        interactor.updateUserPosition()
    }
}
