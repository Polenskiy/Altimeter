//
//
//
//  ShareRouter.swift
//	Where my children
//

import UIKit

final class ShareRouter {
    
    private let imagePickerController: ImagePicker
    private let locationAssembly: LocationAssembly
    private let shareAlert = SharePermissionAlertBuilder()
    
    weak var view: UIViewController!
    
    init(imagePicker: ImagePicker, locationAssembly: LocationAssembly) {
        self.imagePickerController = imagePicker
        self.locationAssembly = locationAssembly
    }
    // MARK: - Functions
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
    
    func navigateToLocationView() {
        let viewController = locationAssembly.module().viewController
        view.navigationController?.pushViewController(viewController, animated: true)
    }
  
    func showActivityViewController(with photo: UIImage) {
        let activityViewController = UIActivityViewController(
            activityItems: [photo],
            applicationActivities: nil
        )
        view.present(activityViewController, animated: true)
    }
}
