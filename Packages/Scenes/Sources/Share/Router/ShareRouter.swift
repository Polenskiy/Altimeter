//
//
//
//  ShareRouter.swift
//	Where my children
//

import UIKit

final class ShareRouter {
    
    private let imagePickerController: ImagePicker
    private let shareAlert = SharePermissionAlertBuilder()
    
    weak var view: UIViewController!
    
    // MARK: - Functions
    init(imagePicker: ImagePicker) {
        self.imagePickerController = imagePicker
    }
}

// MARK: - ShareRouterInput
extension ShareRouter: ShareRouterInput {
    func needPhotoLibraryPermissionAlert() {
        view.present(shareAlert.getPermissionAlert(), animated: true)
    }
    
    func needCameraPermissionAlert() {
        view.present(shareAlert.getPermissionAlert(), animated: true)
    }
    
    func showPhotoLibrary(completion: ((UIImage) -> ())?) {
        imagePickerController.showImagePicker(in: view, completion: completion)
    }
    
    func showCamera(completion: ((UIImage) -> ())?) {
        imagePickerController.showCamera(in: view, completion: completion)
    }
}
