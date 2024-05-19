//
//
//
//  LaunchViewController.swift
//	Where my children
//

import UIKit
import CoreLocation

class LaunchViewController: UIViewController {
    private let compassView = CompassView()
    private let geoPermissionManager = GeoPermissionManager()
    private let locationListener = LocationListener()
    
    var output: LaunchViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
        geoPermissionManager.requestAuthorization()
        locationListener.startUpdatingHeading { [weak self] newHeading in
            let newHeadingDegrees = newHeading.trueHeading > 0 ? newHeading.trueHeading : newHeading.magneticHeading
            self?.compassView.heading = CGFloat(newHeadingDegrees)
        }
    }
}

// MARK: - LaunchViewControllerInput
extension LaunchViewController: LaunchViewControllerInput {
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "#0A2243")
        
        configureCompassView()
    }
}

private extension LaunchViewController {
    func configureCompassView() {
        view.addSubview(compassView)
        compassView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compassView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            compassView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            compassView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            compassView.heightAnchor.constraint(equalToConstant: view.frame.width - 32)
        ])
    }
}
