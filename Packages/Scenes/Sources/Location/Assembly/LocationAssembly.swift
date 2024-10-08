
import DI
import Services

public final class LocationAssembly: DependencyFactory {
    
    private let locationListener: LocationListenerProtocol = LocationListener()
    
    func module() -> LocationModuleInput {
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
    
    private func router() -> LocationRouter {
        unshared(
            factory: {
                LocationRouter()
            }
        )
    }
    
    private func view() -> LocationViewController {
        unshared(
            factory: {
                LocationViewController()
            }
        )
    }
    
    private func interactor() -> LocationInteractor {
        unshared(
            factory: {
                LocationInteractor(locationListener: locationListener)
            }
        )
    }
    
    private func presenter() -> LocationPresenter {
        unshared(
            factory: {
                LocationPresenter()
            }
        )
    }
    
}
