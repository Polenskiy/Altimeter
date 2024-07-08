//
//
//
//  ShareInteractor.swift
//	Where my children
//
import Services
import Foundation

final class ShareInteractor {
    
    weak var output: ShareInteractorOutput?

    private var photoPermissionManager: PhotoPermissionManagerProtocol
    
    
    init(photoPermissionManager: PhotoPermissionManagerProtocol) {
        self.photoPermissionManager = photoPermissionManager
    }
}

// MARK: - ShareInteractorInput
extension ShareInteractor: ShareInteractorInput {
    func didTriggerViewReadyEvent() {
        start()
    }
}


private extension ShareInteractor {
    func start() {
        self.requestPhotoPermissionIfNeeded()
    }

    func requestPhotoPermissionIfNeeded() {
        if photoPermissionManager.canRequest {
            photoPermissionManager.requestAuthorization()
        }
    }
    
    func handlePhotoAuthorization() {
        photoPermissionManager.startCheckingPermission()
    }
    
}
