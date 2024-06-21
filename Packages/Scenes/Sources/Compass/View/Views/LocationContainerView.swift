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
        stack.spacing = 50
        stack.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
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
        horizontalStackView.addArrangedSubview(coordinatesView)
        horizontalStackView.addArrangedSubview(addressView)
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

}

