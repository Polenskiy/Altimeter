//
//
//
//  LaunchViewControllerInput.swift
//	Where my children
//

protocol LaunchViewControllerInput: BaseViewControllerInput {
    func update(with state: LaunchPresenter.State)
}
