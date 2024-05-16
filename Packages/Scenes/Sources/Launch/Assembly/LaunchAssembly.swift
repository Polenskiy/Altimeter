//
//
//
//  LaunchAssembly.swift
//	Where my children
//

import DI

public final class LaunchAssembly: DependencyFactory {
    
    public func module() -> LaunchModuleInput {
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
    
    private func router() -> LaunchRouter {
        return unshared(
            factory: {
                return LaunchRouter()
            }
        )
    }
    
    private func view() -> LaunchViewController {
        return unshared(
            factory: {
                return LaunchViewController()
            }
        )
    }
    
    private func interactor() -> LaunchInteractor {
        return unshared(
            factory: {
                return LaunchInteractor()
            }
        )
    }
    
    private func presenter() -> LaunchPresenter {
        return unshared(
            factory: {
                return LaunchPresenter()
            }
        )
    }
}