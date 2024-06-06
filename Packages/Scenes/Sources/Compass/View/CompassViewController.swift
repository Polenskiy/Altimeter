//
//
//
//  CompassViewController.swift
//	Where my children
//

import UIKit

final class CompassViewController: UIViewController {
    
    var output: CompassViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
}

// MARK: - CompassViewControllerInput
extension CompassViewController: CompassViewControllerInput {
    func setupInitialState() {
        view.backgroundColor = .systemPink
    }
}
