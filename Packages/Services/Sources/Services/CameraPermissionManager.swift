//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 19.07.2024.
//
import AVFoundation

public protocol CameraPermissionManagerProtocol {
    var canRequest: Bool { get }
    var hasPermission: Bool { get }
    func requestAuthorization()
    func startCheckingPermission()
    
}

public final class CameraPermissionManager: CameraPermissionManagerProtocol {
    
    public var canRequest: Bool {
        AVCaptureDevice.authorizationStatus(for: .video) == .notDetermined
    }
    
    public var hasPermission: Bool {
        validStatus.contains(AVCaptureDevice.authorizationStatus(for: .video))
    }
    
    public var permissionStatusChangeHandler: ((Bool) -> Void)?
    
    private let validStatus: [AVAuthorizationStatus] = [.authorized]
    
    public func requestAuthorization() {
        AVCaptureDevice.requestAccess(for: .video) { [weak self] _ in
            DispatchQueue.main.async {
                self?.checkPermission()
            }
        }
    }
    
    public func startCheckingPermission() {
        checkPermission()
    }
    
}

private extension CameraPermissionManager {
    func checkPermission() {
        permissionStatusChangeHandler?(hasPermission)
    }
}

