//
//
//
//  MapViewController.swift
//	Where my children
//

import UIKit

final class MapViewController: UIViewController {
    
    var output: MapViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
}

// MARK: - MapViewControllerInput
extension MapViewController: MapViewControllerInput {
    func setupInitialState() {
    }    
}
