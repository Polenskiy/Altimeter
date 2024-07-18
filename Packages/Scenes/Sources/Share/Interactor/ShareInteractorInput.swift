//
//
//
//  ShareTestInteractorInput.swift
//	Where my children
//

protocol ShareInteractorInput: AnyObject { 
    
    func didTriggerViewReadyEvent()
    func canOpenCameraRoll() -> Bool
    func requestPermission(completion: @escaping (Bool) -> Void)
    func requestAuthorizationIfForbidden()
}
