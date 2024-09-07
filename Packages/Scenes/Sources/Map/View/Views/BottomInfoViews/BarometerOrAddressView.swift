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
    
    private let barometerDetailView: MapBarometerDetailView = {
        let view = MapBarometerDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let speedView: SpeedOrAltitudeView = SpeedOrAltitudeView()
    
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
        NSLayoutConstraint.activate([
            barometerDetailView.widthAnchor.constraint(equalToConstant: 127)
        ])
    }
    
}

extension BarometerOrAddressView {
    func update(with viewModel: MapViewController.MapInformationViewModel, type: MapMetricsView.MapMetricsType) {
        barometerDetailView.update(with: viewModel, type: type)
        speedView.configure(with: "\(viewModel.speed) m/s")
    }
}