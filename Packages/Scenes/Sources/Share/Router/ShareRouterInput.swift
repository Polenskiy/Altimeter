//
//
//
//  ShareRouterInput.swift
//	Where my children
//
import UIKit

protocol ShareRouterInput: AnyObject {
    func showImagePicker(completion: ((UIImage) -> ())?)
    func needCameraRollPermissionAlert()
}
