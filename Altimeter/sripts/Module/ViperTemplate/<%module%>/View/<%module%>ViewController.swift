//
//
//
//  <%module%>ViewController.swift
//	<%project%>
//

import UIKit

class <%module%>ViewController: UIViewController {
    
    var output: <%module%>ViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
}

// MARK: - <%module%>ViewControllerInput
extension <%module%>ViewController: <%module%>ViewControllerInput {
    func setupInitialState() {
    }    
}
