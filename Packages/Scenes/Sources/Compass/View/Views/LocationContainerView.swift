//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 20.06.2024.
//

import UIKit

final class LocationContainerView: UIView {
    
    private let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let coordinatesView = LocationView(title: "Coordinates")
    private let addressView = LocationView(title: "Address")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: CompassViewController.AddressViewModel) {
        coordinatesView.updateSubtitle("\(viewModel.latitude), \(viewModel.longitude)")
        addressView.updateSubtitle(viewModel.address)
    }
}

extension LocationContainerView {
    
    func setup() {
        configureHorizontalStackView()
        configureAddressView()
        configureCoordinatesView()
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
    
    func configureAddressView() {
        horizontalStackView.addArrangedSubview(addressView)
        NSLayoutConstraint.activate([
            addressView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 24),
            addressView.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: -24),
            addressView.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor, constant: 24)
        ])
    }
    
    func configureCoordinatesView() {
        horizontalStackView.addArrangedSubview(coordinatesView)
        NSLayoutConstraint.activate([
            coordinatesView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 24),
            coordinatesView.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: -24),
            coordinatesView.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor, constant: -24)
        ])
    }

}

