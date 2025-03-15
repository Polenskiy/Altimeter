//
//
//
//  MenuPresenter.swift
//	Where my children
//

import UIKit

final class MenuPresenter: BasePresenter {
    
    var interactor: MenuInteractorInput!
    weak var view: MenuViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: MenuRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - MenuModuleInput
extension MenuPresenter: MenuModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - MenuInteractorOutput
extension MenuPresenter: MenuInteractorOutput { }

// MARK: - MenuViewControllerOutput
extension MenuPresenter: MenuViewControllerOutput { }
