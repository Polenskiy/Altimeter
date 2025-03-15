//
//
//
//  MenuAssembly.swift
//	Where my children
//
import DI
import Services

public final class MenuAssembly: DependencyFactory {
    
    func module() -> MenuModuleInput {
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
    
    private func router() -> MenuRouter {
        unshared(
            factory: {
                MenuRouter()
            }
        )
    }
    
    private func view() -> MenuViewController {
        unshared(
            factory: {
                MenuViewController()
            }
        )
    }
    
    private func interactor() -> MenuInteractor {
        unshared(
            factory: {
                MenuInteractor()
            }
        )
    }
    
    private func presenter() -> MenuPresenter {
        unshared(
            factory: {
                MenuPresenter()
            }
        )
    }
    
}
