
import CoreLocation

protocol LocationInteractorOutput: AnyObject {
    func didUpdate(location: CLLocation)
}
