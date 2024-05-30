//
//
//
//  LaunchTestInteractorOutput.swift
//	Where my children
//

protocol LaunchInteractorOutput: AnyObject { 
    func updateState(_ state: LaunchPresenter.State)
}
