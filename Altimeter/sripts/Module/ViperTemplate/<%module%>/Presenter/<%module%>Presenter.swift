//
//
//
//  <%module%>Presenter.swift
//	<%project%>
//

import UIKit

final class <%module%>Presenter: BasePresenter {
    
    var interactor: <%module%>InteractorInput!
    weak var view: <%module%>ViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: <%module%>RouterInput!
    
    // MARK: - Functions
    
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - <%module%>ModuleInput
extension <%module%>Presenter: <%module%>ModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - <%module%>InteractorOutput
extension <%module%>Presenter: <%module%>InteractorOutput { }

// MARK: - <%module%>ViewControllerOutput
extension <%module%>Presenter: <%module%>ViewControllerOutput { }
