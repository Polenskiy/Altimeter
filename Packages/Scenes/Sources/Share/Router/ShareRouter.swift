//
//
//
//  ShareRouter.swift
//	Where my children
//

import UIKit

final class ShareRouter {
    
    private let imagePickerController: UIImagePickerController
    
    weak var view: UIViewController!
    
    // MARK: - Functions
    init(imagePicker: UIImagePickerController) {
        self.imagePickerController = imagePicker
        imagePicker.sourceType = .photoLibrary
    }
}

// MARK: - ShareRouterInput
extension ShareRouter: ShareRouterInput {
    
    func showPickerView() {
        let viewController = imagePickerController
        view.present(viewController, animated: true)
    }
}
