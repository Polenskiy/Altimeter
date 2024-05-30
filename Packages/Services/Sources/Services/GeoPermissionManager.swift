//
//  GeoPermissionManager.swift
//
//
//  Created by Vladimir Romashov on 17.05.2024.
//

import CoreLocation
import UIKit

public protocol GeoPermissionManagerProtocol {
    var onStatusChanged: ((Bool) -> Void)? { get set }
    var canRequest: Bool { get }
    var hasPermission: Bool { get }
    func startCheckingPermission()
    func requestAuthorization()
}

public final class GeoPermissionManager: NSObject, GeoPermissionManagerProtocol {
    public var onStatusChanged: ((Bool) -> Void)?
    public var canRequest: Bool {
        CLLocationManager.authorizationStatus() == .notDetermined
    }
    
    public var hasPermission: Bool {
        validStatuses.contains(CLLocationManager.authorizationStatus())
    }
    
    private let locationManager = CLLocationManager()
    private let validStatuses: [CLAuthorizationStatus] = [.authorizedWhenInUse, .authorizedAlways]
    
    
    private var isRequested: Bool = false
    
    public func startCheckingPermission() {
        checkPermission()
        startObservingEnteringForeground()
        startObservingStatusChange()
    }
    
    public func requestAuthorization() {
        isRequested = true
        locationManager.requestWhenInUseAuthorization()
    }
}

extension GeoPermissionManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined, isRequested {
            locationManager.requestWhenInUseAuthorization()
        }
        checkPermission()
    }
}

private extension GeoPermissionManager {
    func checkPermission() {
        onStatusChanged?(hasPermission)
    }
    
    func startObservingStatusChange() {
        locationManager.delegate = self
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
