//
//
//
//  MapAssembly.swift
//	Where my children
//

import DI

public final class MapAssembly: DependencyFactory {
    
    func module() -> MapModuleInput {
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
                MapRouter()
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
                MapInteractor()
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
