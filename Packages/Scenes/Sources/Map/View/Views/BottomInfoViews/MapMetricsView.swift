//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 11.08.2024.
//

import UIKit

final class MapMetricsView: UIView {
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let altitudeView = SpeedOrAltitudeView()
    private let baromterOrAddressView = BarometerOrAddressView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MapMetricsView {
    
    func setup() {
        configureStackView()
        configureAppearenceView()
        configureAltitudeView()
        configureBarometerorAddressView()
    }
    
    func configureStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureAltitudeView() {
        stackView.addArrangedSubview(altitudeView)
        altitudeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            altitudeView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 24),
            altitudeView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -24),
            altitudeView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func configureBarometerorAddressView() {
        stackView.addArrangedSubview(baromterOrAddressView)
        baromterOrAddressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baromterOrAddressView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 24),
            baromterOrAddressView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -24),
            baromterOrAddressView.heightAnchor.constraint(equalToConstant: 118)
        ])
    }
    
    func configureAppearenceView() {
        backgroundColor = UIColor(named: "lightBlue")
        layer.cornerRadius = 32
        layer.opacity = 0.9
    }
}

extension MapMetricsView {
    
    func updateBarometer(viewModelBarometer: MapViewController.InformationViewModel.Barometer) {
        baromterOrAddressView.updateBarometer(viewModelBarometer: viewModelBarometer)
    }
    
    func updateAddress(viewModel: MapViewController.InformationViewModel.Location) {
        baromterOrAddressView.updateAddress(viewModelLocation: viewModel)
    }
    
    func updateCoordinates(viewModel: MapViewController.InformationViewModel.Location) {
        baromterOrAddressView.updateCoordinates(viewModelLocation: viewModel)
    }
    
    func updateSpeed(viewModel: MapViewController.InformationViewModel.Location) {
        baromterOrAddressView.updateSpeed(viewModelLocation: viewModel)
    }
    
    func updateAltitude(viewModel: MapViewController.InformationViewModel.Location) {
        altitudeView.configure(with: "\(viewModel.altitude) m")
    }
}


