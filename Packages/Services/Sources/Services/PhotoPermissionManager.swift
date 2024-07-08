//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 06.07.2024.
//

import UIKit
import Photos

public protocol PhotoPermissionManagerProtocol {
    var canRequest: Bool { get }
    var hasPermission: Bool { get }
    var onStatusChanged: ((Bool) -> Void)? { get set }
    func requestAuthorization()
    func startCheckingPermission()
    
}

public final class PhotoPermissionManager: NSObject, PhotoPermissionManagerProtocol {
    
    //если это свойство true, то запроса еще не проводилось и нужно будет сделать запрос на разрешение
    public var canRequest: Bool {
        PHPhotoLibrary.authorizationStatus() == .notDetermined
    }
    
    //Если true, то пользователь дал разрешение на доступ к галерее
    public var hasPermission: Bool {
        validStatus.contains( PHPhotoLibrary.authorizationStatus())
    }
    
    public var onStatusChanged: ((Bool) -> Void)?
    
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

private extension PhotoPermissionManager {
    func checkPermission() {
        onStatusChanged?(hasPermission)
    }
    
    func startObservingEnteringForeground() {
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil
        )
    }
    
    @objc func applicationWillEnterForeground() {
        checkPermission()
    }
}
    
    
    

