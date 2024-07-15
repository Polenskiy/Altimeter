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
    func requestPermission(competion: @escaping (Bool) -> Void) {
        if photoPermissionManager.canRequest {
            photoPermissionManager.requestAuthorization()
            photoPermissionManager.onStatusChanged = { hasPermission in
                competion(hasPermission)
            }
        }
    }
    
    func canOpenCameraRoll() -> Bool {
        photoPermissionManager.hasPermission
    }
    
    func didTriggerViewReadyEvent() {
    }
}

