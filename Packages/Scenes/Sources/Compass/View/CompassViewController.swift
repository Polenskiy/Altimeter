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
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "mapIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}

// MARK: - CompassViewControllerInput
extension CompassViewController: CompassViewControllerInput {
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "darkBlue")
        configureCompassView()
        configureCancelButton()
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
    
    func configureCancelButton() {
        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3),
            cancelButton.heightAnchor.constraint(equalToConstant: 60),
            cancelButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        cancelButton.addTarget(self, action: #selector(showMapView), for: .touchUpInside)
    }
    
    @objc func showMapView() {
        output?.onMapControl()
    }
    
}
