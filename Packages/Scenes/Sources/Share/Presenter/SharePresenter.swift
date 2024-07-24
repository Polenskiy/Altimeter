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
    func authorizationForbiddenForPhotoLibrary() {
        router.needPhotoLibraryPermissionAlert()
    }
    
    func authorizationForbiddenForCamera() {
        router.needCameraPermissionAlert()
    }
    
}

// MARK: - ShareViewControllerOutput
extension SharePresenter: ShareViewControllerOutput {
    
    func cameraButtonTapped() {
        if interactor.canOpenCamera() {
            router.showImagePicker(sourceType: .camera) { _ in
                //TODO: - если пользователь сделал снимок, сохранить его в галерею
            }
        } else {
            interactor.requestPermissionCamera { _ in
                
            }
        }
    }
    
    
    func addPhotoButtonTapped() {
        if interactor.canOpenPhotoLibrary() {
            router.showImagePicker(sourceType: .photoLibrary) { [weak self] photo in
                self?.view.didChoose(image: photo)
            }
        } else {
            interactor.requestPermissionPhotoLibrary { [weak self] hasPermission in
                if hasPermission {
                    self?.addPhotoButtonTapped()
                } else {
                    self?.interactor.requestAuthorizationIfForbiddenPhotoLibrary()
                }
            }
        }
    }
}
