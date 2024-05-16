//
//
//
//  LaunchViewController.swift
//	Where my children
//

import UIKit

class LaunchViewController: UIViewController {
    private var name: String = ""
    var output: LaunchViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
}

// MARK: - LaunchViewControllerInput
extension LaunchViewController: LaunchViewControllerInput {
    func setupInitialState() {
    }    
}
