//
//
//
//  MapInteractor.swift
//	Where my children
//
import Services

final class MapInteractor {
    
    private let locationListener: LocationListenerProtocol
    private let barometerListener: BarometerListenerProtocol
    
    init(locationListener: LocationListenerProtocol, barometerListener: BarometerListenerProtocol) {
        self.locationListener = locationListener
        self.barometerListener = barometerListener
        
        locationListener.startUpdatingLocation { location in
            guard let location = location else {
                return
            }
            self.output?.didUpdate(location: location)
        }
        
        barometerListener.startUpdatingBarometer { data, error in
            guard let data = data, error == nil else {
                return
            }
            //Не вызывается
            self.output?.didUpdate(barometer: data)
        }
    }
    
    weak var output: MapInteractorOutput?
    
    // MARK: - Functions
}

// MARK: - MapInteractorInput
extension MapInteractor: MapInteractorInput { }
