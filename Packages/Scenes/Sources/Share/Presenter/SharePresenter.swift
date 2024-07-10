//
//
//
//  SharePresenter.swift
//	Where my children
//

import UIKit

final class SharePresenter: BasePresenter {
    
    var interactor: ShareInteractorInput!
    weak var view: ShareViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: ShareRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        interactor.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - ShareModuleInput
extension SharePresenter: ShareModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - ShareInteractorOutput
extension SharePresenter: ShareInteractorOutput {
}

// MARK: - ShareViewControllerOutput
extension SharePresenter: ShareViewControllerOutput { 
    
    func addPhotoButtonTapped() {
        if interactor.canOpenCameraRoll() {
            router.showPickerView()
        }
    }
}
