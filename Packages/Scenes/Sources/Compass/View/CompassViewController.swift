//
//
//
//  CompassViewController.swift
//	Where my children
//

import UIKit

final class CompassViewController: UIViewController {
    
    var output: CompassViewControllerOutput?
    
    let compassView: CompassView = CompassView()
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
}

// MARK: - CompassViewControllerInput
extension CompassViewController: CompassViewControllerInput {
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "darkBlue")
        configureCompassView()
    }
}

private extension CompassViewController {
    func configureCompassView() {
        view.addSubview(compassView)
              compassView.translatesAutoresizingMaskIntoConstraints = false
              NSLayoutConstraint.activate([
                  compassView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
                  compassView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
                  compassView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                  compassView.heightAnchor.constraint(equalToConstant: view.frame.width - 32)
              ])
    }
}
