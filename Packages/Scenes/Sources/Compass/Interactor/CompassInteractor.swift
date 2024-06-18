//
//
//
//  CompassInteractor.swift
//	Where my children
//
import Services

final class CompassInteractor {
    
    weak var output: CompassInteractorOutput?
    
    private let locationListener: LocationListenerProtocol
    
    init(locationListener: LocationListenerProtocol) {
        self.locationListener = locationListener
        locationListener.startUpdatingHeading { heading in
            self.output?.update(heading: heading)
        }
        
        locationListener.startUpdatingLocation { location in
            guard let location = location else { return }
            self.output?.updateCoordinatesAndAddress(location: location)
        }
    }
    
    deinit {
        locationListener.stopUpdatingHeading()
    }
    // MARK: - Functions
}

// MARK: - CompassInteractorInput
extension CompassInteractor: CompassInteractorInput { 
    
    
}
