//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 13.08.2024.
//

import UIKit

final class BarometerOrAddressView: UIView {
    
    private let horizontalStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let barometerDetailView = MapBarometerDetailView()
    private let speedView = SpeedOrAltitudeView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BarometerOrAddressView {
    
    func setup() {
        horizontalStackView.addArrangedSubview(speedView)
        configureHorizontalStackView()
        configureBarometerDetailView()
        
    }
    
    func configureHorizontalStackView() {
        addSubview(horizontalStackView)
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureBarometerDetailView() {
        horizontalStackView.addArrangedSubview(barometerDetailView)
        barometerDetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barometerDetailView.widthAnchor.constraint(equalToConstant: 127)
        ])
    }
}

extension BarometerOrAddressView {
    func update(
        viewModelBarometer: MapViewController.InformationViewModel.Barometer,
        viewModelLocation: MapViewController.InformationViewModel.Location,
        type: MapMetricsView.MapMetricsType
    ) {
        barometerDetailView.update(
            viewModelBarometer: viewModelBarometer,
            viewModelLocation: viewModelLocation,
            type: type
        )
        speedView.configure(with: "\(viewModelLocation.speed) m/s")
    }
}
