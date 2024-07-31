//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 06.07.2024.
//

import UIKit
import Photos

public protocol PhotoLibraryPermissionManagerProtocol {
    var canRequest: Bool { get }
    var hasPermission: Bool { get }
    var permissionStatusChangeHandler: ((Bool) -> Void)? { get set }
    func requestAuthorization()
    func startCheckingPermission()
}

public final class PhotoLibraryPermissionManager: NSObject, PhotoLibraryPermissionManagerProtocol {
    
    public var canRequest: Bool {
        PHPhotoLibrary.authorizationStatus() == .notDetermined
    }

    public var hasPermission: Bool {
        validStatus.contains( PHPhotoLibrary.authorizationStatus())
    }
    
    public var permissionStatusChangeHandler: ((Bool) -> Void)?
    
    private let validStatus: [PHAuthorizationStatus] = [.authorized]
    
    private var isRequsted: Bool = false
    
    public func requestAuthorization() {
        isRequsted = true
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            DispatchQueue.main.async {
                self?.checkPermission()
            }
        }
    }
    
    public func startCheckingPermission() {
        checkPermission()
        startObservingEnteringForeground()
    }
}

private extension PhotoLibraryPermissionManager {
    func checkPermission() {
        permissionStatusChangeHandler?(hasPermission)
    }
    
    func startObservingEnteringForeground() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }
    
    @objc func applicationWillEnterForeground() {
        checkPermission()
    }
}
    
    
    

