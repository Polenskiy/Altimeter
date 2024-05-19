//
//
//
//  LaunchPresenter.swift
//	Where my children
//

import UIKit

extension LaunchPresenter {
    enum State {
        case normal
        case error(Error)
        
        enum Error {
            case noInternet
            case noGPS
        }
        
        var viewModel: ViewModel {
            switch self {
            case .normal:
                return .init(title: "altimeter".uppercased(), shouldShowBorder: false)
            case .error(let error):
                switch error {
                case .noInternet:
                    return .init(title: "No internet connection", shouldShowBorder: true)
                case .noGPS:
                    return .init(title: "No PGS connection", shouldShowBorder: true)
                }
            }
        }
    }
    
    struct ViewModel {
        let title: String
        let shouldShowBorder: Bool
    }
}

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
        
        view.update(with: .error(.noInternet))
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
