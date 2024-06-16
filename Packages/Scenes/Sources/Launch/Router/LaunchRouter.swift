//
//
//
//  LaunchRouter.swift
//	Where my children
//

import UIKit

class LaunchRouter {
    private let mapAssembly: MapAssembly
    
    weak var view: UIViewController!
    
    // MARK: - Functions
    init(mapAssembly: MapAssembly) {
        self.mapAssembly = mapAssembly
    }
}

// MARK: - LaunchRouterInput
extension LaunchRouter: LaunchRouterInput {
    func showMap() {
        let viewController = mapAssembly.module().viewController
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
