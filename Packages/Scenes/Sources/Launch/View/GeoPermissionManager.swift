//
//  GeoPermissionManager.swift
//
//
//  Created by Vladimir Romashov on 17.05.2024.
//

import CoreLocation
import UIKit

final class GeoPermissionManager: NSObject {
    var onStatusChanged: ((Bool) -> Void)?
    var canRequest: Bool {
        CLLocationManager.authorizationStatus() == .notDetermined
    }
    
    var hasPermission: Bool {
        validStatuses.contains(CLLocationManager.authorizationStatus())
    }
    
    private let locationManager = CLLocationManager()
    private let validStatuses: [CLAuthorizationStatus] = [.authorizedWhenInUse, .authorizedAlways]
    
    
    private var isRequested: Bool = false
    
    func startCheckingPermission() {
        checkPermission()
        startObservingEnteringForeground()
        startObservingStatusChange()
    }
    
    func requestAuthorization() {
        isRequested = true
        locationManager.requestWhenInUseAuthorization()
    }
}

extension GeoPermissionManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
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
