//
//
//
//  MapInteractor.swift
//	Where my children
//
import Services

final class MapInteractor {
    
    private let locationListener: LocationListenerProtocol
    
    init(locationListener: LocationListenerProtocol) {
        self.locationListener = locationListener
        locationListener.startUpdatingLocation { location in
            guard let location = location else {
                return
            }
            self.output?.didUpdate(location: location)
        }
    }
    
    weak var output: MapInteractorOutput?
    
    // MARK: - Functions
}

// MARK: - MapInteractorInput
extension MapInteractor: MapInteractorInput { }
