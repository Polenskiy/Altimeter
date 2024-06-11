//
//
//
//  CompassPresenter.swift
//	Where my children
//

import UIKit
import CoreLocation

final class CompassPresenter: BasePresenter {
    
    var interactor: CompassInteractorInput!
    weak var view: CompassViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: CompassRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - CompassModuleInput
extension CompassPresenter: CompassModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - CompassInteractorOutput
extension CompassPresenter: CompassInteractorOutput {
    func update(heading: CLHeading) {
        view.update(heading: heading.trueHeading)
    }
}

// MARK: - CompassViewControllerOutput
extension CompassPresenter: CompassViewControllerOutput { 
    
    func onBackButton() {
        router.pop()
    }
}
