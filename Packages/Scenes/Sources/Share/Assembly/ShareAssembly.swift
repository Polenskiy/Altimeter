
import DI
import Services
import UIKit

public final class ShareAssembly: DependencyFactory {
    
    private let services: Services = Services.assembly()
    
    private let imagePicker = ImagePicker()
    
    private let activityViewController = UIActivityViewController(
        activityItems: [""],
        applicationActivities:  nil
    )
    
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
                ShareRouter(imagePicker: imagePicker, activityViewController: activityViewController)
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
                ShareInteractor(
                    photoLibraryPermissionManager: services.photoLibraryPermissionManager(),
                    cameraPermissionManager: services.cameraPermissionManager(),
                    locationListener: services.locationListener()
                )
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
