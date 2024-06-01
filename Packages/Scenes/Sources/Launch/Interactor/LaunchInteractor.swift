//
//
//
//  LaunchInteractor.swift
//	Where my children
//

import Services
import Foundation

final class LaunchInteractor {
    weak var output: LaunchInteractorOutput?
    
    private var geoPermissionManager: GeoPermissionManagerProtocol
    private var networkMonitor: NetworkMonitorProtocol
    
    private var isNoInternet = false {
        didSet {
            updateState()
        }
    }
    private var isNoGps = false {
        didSet {
            updateState()
        }
    }

    
    // MARK: - Functions

    init(
        geoPermissionManager: GeoPermissionManagerProtocol,
        networkMonitor: NetworkMonitorProtocol
    ) {
        self.geoPermissionManager = geoPermissionManager
        self.networkMonitor = networkMonitor
    }
    
    deinit {
        networkMonitor.stopMonitoring()
    }
}

// MARK: - LaunchInteractorInput
extension LaunchInteractor: LaunchInteractorInput {
    func didTriggerViewReadyEvent() {
        startWithDelay()
    }
}

private extension LaunchInteractor {
    func startWithDelay() {
        updateState()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.requestGeoPermissionIfNeeded()
            self?.handleGeoAuthorization()
            self?.checkInternetConnecion()
        }
    }
    
    func requestGeoPermissionIfNeeded() {
        if geoPermissionManager.canRequest {
            geoPermissionManager.requestAuthorization()
        }
    }
    
    func handleGeoAuthorization() {
        geoPermissionManager.startCheckingPermission()
        geoPermissionManager.onStatusChanged = { [weak self] value in
            self?.isNoGps = !value
        }
    }
    
    func checkInternetConnecion() {
        networkMonitor.startMonitoring()
        networkMonitor.onStatusChanged = { [weak self] value in
            self?.isNoInternet = !value
        }
    }
    
    func updateState() {
        if isNoInternet {
            output?.updateState(.error(.noInternet))
        } else if isNoGps {
            output?.updateState(.error(.noGPS))
        } else {
            output?.updateState(.normal)
        }
    }
}
