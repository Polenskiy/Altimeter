//
//
//
//  MapViewController.swift
//	Where my children
//

import UIKit

extension MapViewController {
    struct MapInformationViewModel {
        let speed: String
        let altitude: String
        let latitude: String
        let longitude: String
        let barometer: String
        let address: String
    }
}

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
    
    private let mapDataScrollView: MapDataScrollView = {
        let view = MapDataScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var output: MapViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
        setup()
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
            controlsView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 16),
            controlsView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -16),
            controlsView.topAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.topAnchor, constant: 44),
        ])
        controlsView.configure(with: [
            .compass { [weak self] _ in
                self?.output?.onCompassControl()
            },
            .share { [weak self] _ in
                self?.output?.onShareControl()
            },
            .layers { _ in },
            .menu { _ in },
            .position { _ in }
        ])
    }
    
    func updateData(with viewModel: MapInformationViewModel) {
        mapDataScrollView.updateLocation(with: viewModel)
    }
}

private extension MapViewController {
    func setup() {
        confugureMapView()
        configureMapScrollView()
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
    
    func configureMapScrollView() {
        view.addSubview(mapDataScrollView)
        
        NSLayoutConstraint.activate([
            mapDataScrollView.topAnchor.constraint(equalTo: controlsView.bottomAnchor, constant: 32),
            mapDataScrollView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -49),
            mapDataScrollView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
            mapDataScrollView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
            mapDataScrollView.heightAnchor.constraint(equalToConstant: 227)
        ])
    }
}
