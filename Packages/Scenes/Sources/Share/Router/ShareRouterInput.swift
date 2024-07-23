//
//
//
//  ShareRouterInput.swift
//	Where my children
//
import UIKit

protocol ShareRouterInput: AnyObject {
    func showPhotoLibrary(completion: ((UIImage) -> ())?)
    func showCamera(completion: ((UIImage) -> ())?)
    func needPhotoLibraryPermissionAlert()
    func needCameraPermissionAlert()
}
