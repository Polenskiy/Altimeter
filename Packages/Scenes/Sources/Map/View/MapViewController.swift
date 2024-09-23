//
//
//
//  MapViewController.swift
//	Where my children
//

import UIKit

// MARK: - InformationViewModel
extension MapViewController {
    struct InformationViewModel {
        struct Location {
            let speed: String
            let altitude: String
            let latitude: String
            let longitude: String
            let address: String
        }
        
        struct Barometer {
            let barometer: String
        }
    }
}
// MARK: - MapViewController
final class MapViewController: UIViewController {
    
    private let mapView = MapView()
    private let controlsView = ControlsView()
    private let mapDataScrollView = MapDataScrollView()
    
    var output: MapViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
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
        configureControlsView()
        confugureMapView()
        configureMapScrollView()
    }

    func updateLocation(viewModel: InformationViewModel.Location) {
        mapDataScrollView.updateFull(viewModelLocation: viewModel)
        mapDataScrollView.updateBase(viewModelLocation: viewModel)
    }
    
    func updateBarometer(viewModel: InformationViewModel.Barometer) {
        mapDataScrollView.updateBarometer(viewModelBarometer: viewModel)
    }
}

private extension MapViewController {
    
    func confugureMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func configureControlsView() {
        mapView.addSubview(controlsView)
        controlsView.translatesAutoresizingMaskIntoConstraints = false
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
    
    func configureMapScrollView() {
        view.addSubview(mapDataScrollView)
        mapDataScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapDataScrollView.topAnchor.constraint(equalTo: controlsView.bottomAnchor, constant: 32),
            mapDataScrollView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -49),
            mapDataScrollView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
            mapDataScrollView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
            mapDataScrollView.heightAnchor.constraint(equalToConstant: 227)
        ])
    }
}
