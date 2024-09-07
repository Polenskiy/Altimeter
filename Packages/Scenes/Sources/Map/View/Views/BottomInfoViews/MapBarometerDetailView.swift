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
    
    private lazy var barometerView = BarometerSuperDetailView(title: "Barometer")
    private lazy var coordinatesView = BarometerSuperDetailView(title: "Coordinates")
    private lazy var addressView = BarometerSuperDetailView(title: "Address")
    
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
    
    func update(
        with viewModel: MapViewController.MapInformationViewModel,
        type: MapMetricsView.MapMetricsType
    ) {
        switch type {
        case .fullMetrics:
            verticalStackView.addArrangedSubview(barometerView)
            verticalStackView.addArrangedSubview(coordinatesView)
            barometerView.updateSubtitle(viewModel.barometer)
            coordinatesView.updateSubtitle("\(viewModel.latitude), \(viewModel.longitude)")
        case .baseMetrics:
            verticalStackView.addArrangedSubview(addressView)
            addressView.updateSubtitle(viewModel.address)
        }
    }
}
