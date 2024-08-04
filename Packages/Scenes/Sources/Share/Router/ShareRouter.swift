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
    
    func showImagePicker(sourceType: UIImagePickerController.SourceType, completion: ((UIImage) -> ())?) {
        imagePickerController.showImagePicker(in: view, completion: completion, sourceType: sourceType )
    }
    
    func showActivityViewController(with photos: [Any]) {
        let activityViewController = UIActivityViewController(
            activityItems: photos,
            applicationActivities: nil
        )
        view.present(activityViewController, animated: true)
    }
}
