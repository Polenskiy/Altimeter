
import DI
import Services

public final class ShareAssembly: DependencyFactory {
    
    private let services: Services = Services.assembly()
    
    private let imagePicker = ImagePicker()
    
   public func module() -> ShareModuleInput {
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
    
    private func router() -> ShareRouter {
        unshared(
            factory: {
                ShareRouter(imagePicker: imagePicker)
            }
        )
    }
    
    private func view() -> ShareViewController {
        unshared(
            factory: {
                ShareViewController()
            }
        )
    }
    
    private func interactor() -> ShareInteractor {
        unshared(
            factory: {
                ShareInteractor(photoPermissionManager: services.photoPermissionManager())
            }
        )
    }
    
    private func presenter() -> SharePresenter {
        unshared(
            factory: {
                SharePresenter()
            }
        )
    }
    
}
