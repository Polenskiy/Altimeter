//
//
//
//  ShareInteractor.swift
//	Where my children
//
import Services

final class ShareInteractor {
    
    weak var output: ShareInteractorOutput?

    private var photoPermissionManager: PhotoPermissionManagerProtocol
    
    init(photoPermissionManager: PhotoPermissionManagerProtocol) {
        self.photoPermissionManager = photoPermissionManager
    }
}

// MARK: - ShareInteractorInput
extension ShareInteractor: ShareInteractorInput {
    func requestPermission(completion: @escaping (Bool) -> Void) {
        if photoPermissionManager.canRequest {
            photoPermissionManager.requestAuthorization()
            photoPermissionManager.permissionStatusChangeHandler = { hasPermission in
                completion(hasPermission)
            }
        } else {
            requestAuthorizationIfForbidden()
        }
    }
    
    func requestAuthorizationIfForbidden() {
        if !photoPermissionManager.hasPermission {
            output?.authorizationForbidden()
        }
    }
    
    func canOpenCameraRoll() -> Bool {
        photoPermissionManager.hasPermission
    }
    
    func didTriggerViewReadyEvent() {
    }
}

