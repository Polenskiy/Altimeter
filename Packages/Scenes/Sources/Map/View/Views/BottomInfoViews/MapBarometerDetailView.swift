//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 13.08.2024.
//

import UIKit


final class MapBarometerDetailView: UIView {
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var barometerView = BarometerSuperDetailView()
    private lazy var coordinatesView = BarometerSuperDetailView()
    private lazy var addressView = BarometerSuperDetailView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MapBarometerDetailView {
    
    func setup() {
        configureVerticaleStackView()
    }
    
    func configureVerticaleStackView() {
        addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension MapBarometerDetailView {
    
    //TODO: Сделать два метода для вывода данных
    
//    func update(
//        viewModelBarometer: MapViewController.InformationViewModel.Barometer,
//        type: MapMetricsView.MapMetricsType) {
//        switch type {
//        case .fullMetrics:
//            barometerView.update(title: "barometer", subtitle: viewModelBarometer.barometer)
//        case .baseMetrics:
//            
//        }
//    }
    
    func update(
        viewModelLocation: MapViewController.InformationViewModel.Location,
        viewModelBarometer: MapViewController.InformationViewModel.Barometer,
        type: MapMetricsView.MapMetricsType
    ) {
        switch type {
        case .fullMetrics:
            verticalStackView.addArrangedSubview(barometerView)
            verticalStackView.addArrangedSubview(coordinatesView)
            
            barometerView.update(
                title: "Barometer",
                subtitle: viewModelBarometer.barometer
            )
            coordinatesView.update(
                title: "Coordinates",
                subtitle:"\(viewModelLocation.latitude), \(viewModelLocation.longitude)"
            )
        case .baseMetrics:
            verticalStackView.addArrangedSubview(addressView)
            addressView.update(
                title: "Address",
                subtitle: viewModelLocation.address
            )
        }
    }
}
