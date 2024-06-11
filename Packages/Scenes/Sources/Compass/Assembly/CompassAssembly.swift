//
//
//
//  CompassAssembly.swift
//	Where my children
//
import DI
import Services

public final class CompassAssembly: DependencyFactory {
    
    private let locationListener: LocationListenerProtocol = LocationListener()
    
   public func module() -> CompassModuleInput {
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
    
    private func router() -> CompassRouter {
        unshared(
            factory: {
                CompassRouter()
            }
        )
    }
    
    private func view() -> CompassViewController {
        unshared(
            factory: {
                CompassViewController()
            }
        )
    }
    
    private func interactor() -> CompassInteractor {
        unshared(
            factory: {
                CompassInteractor(locationListener: locationListener)
            }
        )
    }
    
    private func presenter() -> CompassPresenter {
        unshared(
            factory: {
                CompassPresenter()
            }
        )
    }
    
}
