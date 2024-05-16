//
//
//
//  <%module%>Assembly.swift
//	<%project%>
//

public final class <%module%>Assembly: DependencyFactory {
    
    func module() -> <%module%>ModuleInput {
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
    
    private func router() -> <%module%>Router {
        unshared(
            factory: {
                <%module%>Router()
            }
        )
    }
    
    private func view() -> <%module%>ViewController {
        unshared(
            factory: {
                <%module%>ViewController()
            }
        )
    }
    
    private func interactor() -> <%module%>Interactor {
        unshared(
            factory: {
                <%module%>Interactor()
            }
        )
    }
    
    private func presenter() -> <%module%>Presenter {
        unshared(
            factory: {
                <%module%>Presenter()
            }
        )
    }
    
}
