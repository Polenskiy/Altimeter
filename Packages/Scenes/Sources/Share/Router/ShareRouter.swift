//
//
//
//  ShareRouter.swift
//	Where my children
//

import UIKit

final class ShareRouter {
    
    private let imagePickerController: ImagePicker
    
    weak var view: UIViewController!
    
    // MARK: - Functions
    init(imagePicker: ImagePicker) {
        self.imagePickerController = imagePicker
    }
}

// MARK: - ShareRouterInput
extension ShareRouter: ShareRouterInput {
    
    func showImagePicker(completion: ((UIImage) -> ())?) {
        imagePickerController.showImagePicker(in: view, completion: completion)
    }
}
