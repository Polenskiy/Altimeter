//
//
//
//  MapRouter.swift
//	Where my children
//

import UIKit

final class MapRouter {
    
    weak var view: UIViewController!
    
    private let compassAssembly: CompassAssembly
    
    init(compassAssembly: CompassAssembly) {
        self.compassAssembly = compassAssembly
    }
    // MARK: - Functions
}

// MARK: - MapRouterInput
extension MapRouter: MapRouterInput {
    func showCompass() {
        let viewController = compassAssembly.module().viewController
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
