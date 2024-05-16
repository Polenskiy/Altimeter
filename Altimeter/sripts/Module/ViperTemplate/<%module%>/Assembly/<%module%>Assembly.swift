//
//
//
//  <%module%>Assembly.swift
//	<%project%>
//

class <%module%>Assembly: DependencyFactory {
    
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
        return unshared(
            factory: {
                return <%module%>Router()
            }
        )
    }
    
    private func view() -> <%module%>ViewController {
        return unshared(
            factory: {
                return <%module%>ViewController()
            }
        )
    }
    
    private func interactor() -> <%module%>Interactor {
        return unshared(
            factory: {
                return <%module%>Interactor()
            }
        )
    }
    
    private func presenter() -> <%module%>Presenter {
        return unshared(
            factory: {
                return <%module%>Presenter()
            }
        )
    }
    
}
