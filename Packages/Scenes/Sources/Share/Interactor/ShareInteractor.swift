//
//
//
//  ShareInteractor.swift
//	Where my children
//
import Services
import CoreLocation

// MARK: - class ShareInteractor
final class ShareInteractor {
    
    weak var output: ShareInteractorOutput?

    private var photoLibraryPermissionManager: PhotoLibraryPermissionManagerProtocol
    private var cameraPermissionManager: CameraPermissionManagerProtocol
    private let locationListener: LocationListenerProtocol
    
    init(
        photoLibraryPermissionManager: PhotoLibraryPermissionManagerProtocol,
        cameraPermissionManager: CameraPermissionManagerProtocol,
        locationListener: LocationListenerProtocol
    ) {
        self.photoLibraryPermissionManager = photoLibraryPermissionManager
        self.cameraPermissionManager = cameraPermissionManager
        self.locationListener = locationListener
    }
}

// MARK: - ShareInteractorInput
extension ShareInteractor: ShareInteractorInput {
    func getLocation() -> CLLocation? {
        locationListener.getLocation()
    }
    
    func requestPermissionPhotoLibrary(completion: @escaping (Bool) -> Void) {
        if photoLibraryPermissionManager.canRequest {
            photoLibraryPermissionManager.requestAuthorization()
            photoLibraryPermissionManager.permissionStatusChangeHandler = { hasPermission in
                completion(hasPermission)
            }
        } else {
            requestAuthorizationIfForbiddenPhotoLibrary()
        }
    }
    
    func requestPermissionCamera(completion: @escaping (Bool) -> Void) {
        if cameraPermissionManager.canRequest {
            cameraPermissionManager.requestAuthorization()
            photoLibraryPermissionManager.permissionStatusChangeHandler = { hasPermission in
                completion(hasPermission)
            }
        } else {
            requestAuthorizationIfForbiddenCamera()
        }
    }
    
    func requestAuthorizationIfForbiddenPhotoLibrary() {
        if !photoLibraryPermissionManager.hasPermission {
            output?.authorizationForbiddenForPhotoLibrary()
        }
    }
    
    func requestAuthorizationIfForbiddenCamera() {
        if !cameraPermissionManager.hasPermission {
            output?.authorizationForbiddenForCamera()
        }
    }
    
    func canOpenPhotoLibrary() -> Bool {
        photoLibraryPermissionManager.hasPermission
    }
    
    func canOpenCamera() -> Bool {
        cameraPermissionManager.hasPermission
    }
}

