//
//
//
//  LaunchPresenter.swift
//	Where my children
//

import UIKit

class LaunchPresenter: BasePresenter {
    
    var interactor: LaunchInteractorInput!
    weak var view: LaunchViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: LaunchRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - LaunchModuleInput
extension LaunchPresenter: LaunchModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - LaunchInteractorOutput
extension LaunchPresenter: LaunchInteractorOutput { }

// MARK: - LaunchViewControllerOutput
extension LaunchPresenter: LaunchViewControllerOutput { }
