

import UIKit

final class LocationPresenter: BasePresenter {
    
    var interactor: LocationInteractorInput!
    weak var view: LocationViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: LocationRouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - LocationModuleInput
extension LocationPresenter: LocationModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - LocationInteractorOutput
extension LocationPresenter: LocationInteractorOutput { }

// MARK: - LocationViewControllerOutput
extension LocationPresenter: LocationViewControllerOutput { }
