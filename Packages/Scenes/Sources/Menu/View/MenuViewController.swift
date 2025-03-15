//
//
//
//  MenuViewController.swift
//	Where my children
//

import UIKit

final class MenuViewController: UIViewController {
    
    var output: MenuViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
}

// MARK: - MenuViewControllerInput
extension MenuViewController: MenuViewControllerInput {
    func setupInitialState() {
    }    
}
