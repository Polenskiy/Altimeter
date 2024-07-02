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
    }
    // MARK: - Functions
}

// MARK: - CompassInteractorInput
extension CompassInteractor: CompassInteractorInput { 
    
    
}
