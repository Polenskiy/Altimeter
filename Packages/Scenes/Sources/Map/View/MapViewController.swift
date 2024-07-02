//
//
//
//  MapViewController.swift
//	Where my children
//

import UIKit

final class MapViewController: UIViewController {
    
    private let mapView: MapView = {
        let view = MapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        confugureMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - MapViewControllerInput
extension MapViewController: MapViewControllerInput {
    func setupInitialState() {
        mapView.addSubview(controlsView)
        NSLayoutConstraint.activate([
            controlsView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
            controlsView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
            controlsView.topAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.topAnchor, constant: 32),
            controlsView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor)
        ])
        controlsView.configure(with: [
            .compass { [weak self] _ in
                self?.output?.onCompassControl()
            },
            .share { _ in
                self.output?.onShareControl()
            },
            .layers { _ in },
            .menu { _ in },
            .position { _ in }
        ])
    }
    
    func confugureMapView() {
        view.addSubview(mapView)
            
            NSLayoutConstraint.activate([
                mapView.topAnchor.constraint(equalTo: view.topAnchor),
                mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
}
