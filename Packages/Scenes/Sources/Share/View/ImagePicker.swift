//
//  File.swift
//
//
//  Created by Daniil Polenskii on 10.07.2024.
//

import UIKit

final class ImagePicker: NSObject {
    
    private lazy var imagePickerController = UIImagePickerController()
    private var completion: ((UIImage) -> ())?
    
    func showImagePicker(in viewController: UIViewController, completion: ((UIImage) -> ())?) {
        self.completion = completion
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        viewController.present(imagePickerController, animated: true)
    }
    
    func showCamera(in viewController: UIViewController, completion: ((UIImage) -> ())?) {
        self.completion = completion
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        viewController.present(imagePickerController, animated: true)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        completion?(image)
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
