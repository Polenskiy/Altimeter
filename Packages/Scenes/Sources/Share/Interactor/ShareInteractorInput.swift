//
//
//
//  ShareTestInteractorInput.swift
//	Where my children
//

protocol ShareInteractorInput: AnyObject { 
    
    func didTriggerViewReadyEvent()
    func canOpenPhotoLibrary() -> Bool
    func canOpenCamera() -> Bool
    func requestPermissionPhotoLibrary(completion: @escaping (Bool) -> Void)
    func requestPermissionCamera(completion: @escaping (Bool) -> Void)
    func requestAuthorizationIfForbiddenPhotoLibrary()
}
