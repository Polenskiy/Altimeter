//
//
//
//  MapViewController.swift
//	Where my children
//

import UIKit

final class MapViewController: UIViewController {
    
    private let controlsView: ControlsView = {
        let view = ControlsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        view.addSubview(controlsView)
        NSLayoutConstraint.activate([
            controlsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controlsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controlsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            controlsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        controlsView.configure(with: [
            .compass { [weak self] _ in
                self?.output?.onCompassControl()
            },
            .share { _ in },
            .layers { _ in },
            .menu { _ in },
            .position { _ in }
        ])
    }
}
