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
    private let shareAssembly: ShareAssembly
    
    init(compassAssembly: CompassAssembly, shareAssembly: ShareAssembly) {
        self.compassAssembly = compassAssembly
        self.shareAssembly = shareAssembly
    }
    // MARK: - Functions
}

// MARK: - MapRouterInput
extension MapRouter: MapRouterInput {
    func showCompass() {
        let viewController = compassAssembly.module().viewController
        view.navigationController?.pushViewController(viewController, animated: true)
    }
    func showShare() {
        let viewController = shareAssembly.module().viewController
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
