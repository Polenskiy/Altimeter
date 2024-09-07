//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 11.08.2024.
//

import UIKit

extension MapMetricsView {
    enum MapMetricsType {
        case fullMetrics
        case baseMetrics
    }
}

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
    
    private let altitudeView: SpeedOrAltitudeView = {
        let view = SpeedOrAltitudeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let baromterOrAddressView: BarometerOrAddressView = {
        let view = BarometerOrAddressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        NSLayoutConstraint.activate([
            altitudeView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 24),
            altitudeView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -24),
            altitudeView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func configureBarometerorAddressView() {
        stackView.addArrangedSubview(baromterOrAddressView)
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
    func update(
        with viewModel: MapViewController.MapInformationViewModel,
        type: MapMetricsType
    ) {
        baromterOrAddressView.update(with: viewModel, type: type)
        altitudeView.configure(with: "\(viewModel.altitude) m")
    }
}

