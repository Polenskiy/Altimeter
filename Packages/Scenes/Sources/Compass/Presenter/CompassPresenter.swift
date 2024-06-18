//
//
//
//  CompassPresenter.swift
//	Where my children
//

import UIKit
import CoreLocation

final class CompassPresenter: BasePresenter {
    
    var interactor: CompassInteractorInput!
    weak var view: CompassViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: CompassRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - CompassModuleInput
extension CompassPresenter: CompassModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - CompassInteractorOutput
extension CompassPresenter: CompassInteractorOutput {
    func updateCoordinatesAndAddress(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self, let placemark = placemarks?.first, error == nil else { return }
            let address = [placemark.thoroughfare, placemark.locality, placemark.country].compactMap { $0 }.joined(separator: ", ")
            view.updateCoordinates(with: "\(location.coordinate.latitude), \(location.coordinate.longitude)")
            view.updateAddress(with: address)
        }
    }
    
    func update(heading: CLHeading) {
        view.update(heading: heading.trueHeading)
    }
}

// MARK: - CompassViewControllerOutput
extension CompassPresenter: CompassViewControllerOutput { 
    
    func onBackButton() {
        router.pop()
    }
}
