
import Services
import CoreLocation

final class LocationInteractor {
    
    private let locationListener: LocationListenerProtocol
    
    init(locationListener: LocationListenerProtocol) {
        self.locationListener = locationListener
        handleUpdatingLocation()
    }
    
    weak var output: LocationInteractorOutput?
    
    // MARK: - Functions
}

// MARK: - LocationInteractorInput
extension LocationInteractor: LocationInteractorInput { }

extension LocationInteractor {
    func handleUpdatingLocation() {
        locationListener.startUpdatingLocation { location in
            guard let location = location else {
                return
            }
            self.output?.didUpdate(location: location)
        }
    }
}
