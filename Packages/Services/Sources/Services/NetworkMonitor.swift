//
//  NetworkMonitor.swift
//
//
//  Created by Vladimir Romashov on 30.05.2024.
//

import Network

public protocol NetworkMonitorProtocol {
    var onStatusChanged: ((Bool) -> Void)? { get set }
    func startMonitoring()
    func stopMonitoring()
}

public final class NetworkMonitor: NetworkMonitorProtocol {
    private var monitor: NWPathMonitor?
    private var isMonitoring = false

    public var onStatusChanged: ((Bool) -> Void)?

    public func startMonitoring() {
        guard !isMonitoring else { 
            return
        }

        monitor = NWPathMonitor()
        let queue = DispatchQueue.global(qos: .background)
        monitor?.start(queue: queue)
        monitor?.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self?.onStatusChanged?(true)
                } else {
                    self?.onStatusChanged?(false)
                }
            }
        }
        isMonitoring = true
    }

    public func stopMonitoring() {
        guard isMonitoring else { return }
        monitor?.cancel()
        monitor = nil
        isMonitoring = false
    }
}
