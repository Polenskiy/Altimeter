// The Swift Programming Language
// https://docs.swift.org/swift-book

import DI

public final class Services: DependencyFactory {
    public func locationListener() -> LocationListenerProtocol {
        shared(
            factory: {
                LocationListener()
            }
        )
    }
    
    public func geoPermissionManager() -> GeoPermissionManagerProtocol { 
        shared(
            factory: {
                GeoPermissionManager()
            }
        )
    }
    
    public func networkMonitor() -> NetworkMonitorProtocol {
        shared(
            factory: {
                NetworkMonitor()
            }
        )
    }
}
