//
//
//
//  MapInteractor.swift
//	Where my children
//
import Services
import CoreLocation

final class MapInteractor {
    
    private let locationListener: LocationListenerProtocol
    
    var location: CLLocation?
    
    init(locationListener: LocationListenerProtocol) {
        self.locationListener = locationListener
        locationListener.startUpdatingLocation { [weak self] location in
            guard let location = location else {
                return
            }
            self?.location = location
            self?.output?.didUpdateRegion(location: location)
            self?.output?.didUpdate(location: location)
        }
    }
    
    weak var output: MapInteractorOutput?
    
    // MARK: - Functions
}

// MARK: - MapInteractorInput
extension MapInteractor: MapInteractorInput { 
    func setUserPosition() {
        guard let location = location else {
            return
        }
        self.output?.didUpdateRegion(location: location)
    }
}
