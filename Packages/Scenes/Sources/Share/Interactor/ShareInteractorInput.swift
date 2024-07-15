//
//
//
//  ShareTestInteractorInput.swift
//	Where my children
//

protocol ShareInteractorInput: AnyObject { 
    
    func didTriggerViewReadyEvent()
    func canOpenCameraRoll() -> Bool
    func requestPermission(competion: @escaping (Bool) -> Void)
}
