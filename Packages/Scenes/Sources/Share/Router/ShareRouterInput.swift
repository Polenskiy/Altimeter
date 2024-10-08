//
//
//
//  ShareRouterInput.swift
//	Where my children
//
import UIKit

protocol ShareRouterInput: AnyObject {
    func showImagePicker(sourceType: UIImagePickerController.SourceType, completion: ((UIImage) -> ())?)
    func needPhotoLibraryPermissionAlert()
    func needCameraPermissionAlert()
    func navigateToLocationView()
    func showActivityViewController(with photo: UIImage)
}
