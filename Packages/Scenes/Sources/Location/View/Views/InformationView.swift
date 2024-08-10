//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 08.08.2024.
//

import UIKit

final class InformationView: UIView {
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let latitude: DetailInformationView = {
        let view = DetailInformationView(title: "Latitude:")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let longitude: DetailInformationView = {
        let view = DetailInformationView(title: "Longitude:")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let altitude: DetailInformationView = {
        let view = DetailInformationView(title: "Altitude:")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let address: DetailInformationView = {
        let view = DetailInformationView(title: "Address:")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let appleMapeLink: DetailInformationView = {
        let view = DetailInformationView(title: "Apple Mape Link:")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let googleMapsLink: DetailInformationView = {
        let view = DetailInformationView(title: "Google Maps Link:")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let referenceApp: DetailInformationView = {
        let view = DetailInformationView(title: "Reference App:")
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

private extension InformationView {
    
    func setup() {
        configureVerticalStackView()
        configureInformationView()
    }
    
    func configureVerticalStackView() {
        addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureInformationView() {
        verticalStackView.addArrangedSubview(latitude)
        verticalStackView.addArrangedSubview(longitude)
        verticalStackView.addArrangedSubview(altitude)
        verticalStackView.addArrangedSubview(address)
        verticalStackView.addArrangedSubview(appleMapeLink)
        verticalStackView.addArrangedSubview(googleMapsLink)
        verticalStackView.addArrangedSubview(referenceApp)
    }
}
