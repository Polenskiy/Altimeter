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
    func canOpenCameraRoll() -> Bool {
        start()
        if photoPermissionManager.hasPermission {
            return true
        } else if photoPermissionManager.canRequest {
            photoPermissionManager.requestAuthorization()
            return false
        } else {
            return false
        }
    }
    
    func didTriggerViewReadyEvent() {
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
