//
//
//
//  CompassInteractor.swift
//	Where my children
//
import Services
import CoreLocation

final class CompassInteractor {
    
    weak var output: CompassInteractorOutput?
    
    private let locationListener: LocationListenerProtocol
    private var previousLocation: CLLocation?
    private let minimumDistance: CLLocationDistance = 50
    
    init(locationListener: LocationListenerProtocol) {
        self.locationListener = locationListener
        locationListener.startUpdatingHeading { heading in
            self.output?.didUpdate(heading: heading)
        }
        
        locationListener.startUpdatingLocation { location in
            guard let location = location else { return }
            self.handleLocationUpdate(with: location)
        }
        
    }
    
    private func handleLocationUpdate(with location: CLLocation) {
        
        guard let previousLocation = previousLocation else {
            self.previousLocation = location
            output?.didUpdate(location: location)
            return
        }
        
        let distance = location.distance(from: previousLocation)
        
        if distance > minimumDistance {
            self.previousLocation = location
            self.output?.didUpdate(location: location)
        }
    }
}
// MARK: - CompassInteractorInput
extension CompassInteractor: CompassInteractorInput { 

}
