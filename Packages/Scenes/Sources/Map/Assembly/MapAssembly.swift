//
//
//
//  MapAssembly.swift
//	Where my children
//

import DI
import Services

public final class MapAssembly: DependencyFactory {
    
    private let compassAssembly: CompassAssembly = CompassAssembly.assembly()
    private let shareAssembly: ShareAssembly = ShareAssembly.assembly()
    private let locationListener: LocationListenerProtocol = LocationListener()
    private let barometerListener: BarometerListenerProtocol = BarometerListener()
    
    public func module() -> MapModuleInput {
        return unshared(
            factory: { [unowned self] in
                let presenter = self.presenter()
                let interactor = self.interactor()
                let view = self.view()
                let router = self.router()
                
                presenter.interactor = interactor
                presenter.view = view
                presenter.router = router
                
                interactor.output = presenter
                
                view.output = presenter
                
                router.view = view
                
                return presenter
            }
        )
    }
    
    private func router() -> MapRouter {
        unshared(
            factory: {
                MapRouter(compassAssembly: compassAssembly, shareAssembly: shareAssembly)
            }
        )
    }
    
    private func view() -> MapViewController {
        unshared(
            factory: {
                MapViewController()
            }
        )
    }
    
    private func interactor() -> MapInteractor {
        unshared(
            factory: {
                MapInteractor(
                    locationListener: locationListener,
                    barometerListener: barometerListener
                )
            }
        )
    }
    
    private func presenter() -> MapPresenter {
        unshared(
            factory: {
                MapPresenter()
            }
        )
    }
    
}
