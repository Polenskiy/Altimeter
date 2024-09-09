

import UIKit
import CoreLocation

final class LocationPresenter: BasePresenter {
    
    var interactor: LocationInteractorInput!
    weak var view: LocationViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: LocationRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - LocationModuleInput
extension LocationPresenter: LocationModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - LocationInteractorOutput
extension LocationPresenter: LocationInteractorOutput { 
    func didUpdate(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self, let placemarks = placemarks?.first, error == nil else {
                return
            }
            let address = [
                placemarks.thoroughfare,
                placemarks.locality,
                placemarks.country
            ].compactMap { $0 }.joined(separator: ", ")
            
            let latitude = String(format: "%.2f", location.coordinate.latitude)
            let longitude = String(format: "%.2f", location.coordinate.longitude)
            let altitude = String(format: "%.2f", location.altitude)
            let appleMapLinks = "https://maps.apple.com/?ll=\(latitude),\(longitude)"
            let googleMapLinks = "https://www.google.com/maps/search/?api=1&query=\(latitude),\(longitude)"
            let referenceApp = "https://yandex.ru/maps/?ll=\(longitude),\(latitude)&z=16"
            
            view.updateData(
                with: InformationContainerView.InformationViewModel(
                    latitude: latitude,
                    longitude: longitude,
                    altitude: altitude,
                    address: address,
                    appleMapLinks: appleMapLinks,
                    googleMapsLink: googleMapLinks,
                    referenceApp: referenceApp
                )
            )
        }
    }
}

// MARK: - LocationViewControllerOutput
extension LocationPresenter: LocationViewControllerOutput { }
