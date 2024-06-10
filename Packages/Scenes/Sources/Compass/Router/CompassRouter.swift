//
//
//
//  CompassRouter.swift
//	Where my children
//

import UIKit

final class CompassRouter {
    
    weak var view: UIViewController!
    
    // MARK: - Functions
}

// MARK: - CompassRouterInput
extension CompassRouter: CompassRouterInput {
    func showMap() {
        view.navigationController?.popViewController(animated: true)
    }
}
