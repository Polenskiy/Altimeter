//
//
//
//  SharePresenter.swift
//	Where my children
//


final class SharePresenter: BasePresenter {
    
    var interactor: ShareInteractorInput!
    weak var view: ShareViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: ShareRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        interactor.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - ShareModuleInput
extension SharePresenter: ShareModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - ShareInteractorOutput
extension SharePresenter: ShareInteractorOutput {
    func authorizationForbidden() {
        router.needCameraRollPermissionAlert()
    }
    
}

// MARK: - ShareViewControllerOutput
extension SharePresenter: ShareViewControllerOutput {
    
    func addPhotoButtonTapped() {
        if interactor.canOpenCameraRoll() {
            router.showImagePicker { [weak self] photo in
                self?.view.didChoose(image: photo)
            }
        } else {
            interactor.requestPermission { [weak self] hasPermission in
                if hasPermission {
                    self?.addPhotoButtonTapped()
                } else {
                    // TODO: - Показать Alert "Предоставль разрешение"
                    self?.interactor.requestAuthorizationIfForbidden()
                }
            }
        }
    }
}
