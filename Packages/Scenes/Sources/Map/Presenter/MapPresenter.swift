//
//
//
//  MapPresenter.swift
//	Where my children
//

import UIKit

final class MapPresenter: BasePresenter {
    
    var interactor: MapInteractorInput!
    weak var view: MapViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: MapRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - MapModuleInput
extension MapPresenter: MapModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - MapInteractorOutput
extension MapPresenter: MapInteractorOutput { }

// MARK: - MapViewControllerOutput
extension MapPresenter: MapViewControllerOutput {
    func onCompassControl() {
        router.showCompass()
    }
    
    func onShareControl() {
        router.showShare()
    }
}
