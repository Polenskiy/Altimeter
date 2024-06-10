//
//
//
//  ShareViewController.swift
//	Where my children
//

import UIKit

final class ShareViewController: UIViewController {
    
    var output: ShareViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
}

// MARK: - ShareViewControllerInput
extension ShareViewController: ShareViewControllerInput {
    func setupInitialState() {
    }    
}
