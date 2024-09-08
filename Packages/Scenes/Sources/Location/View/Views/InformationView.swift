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
    
    private lazy var latitude = DetailInformationView()
    private lazy var longitude = DetailInformationView()
    private lazy var altitude = DetailInformationView()
    private lazy var address = DetailInformationView()
    private lazy var appleMapsLink = DetailInformationView()
    private lazy var googleMapsLink = DetailInformationView()
    private lazy var referenceApp = DetailInformationView()
    
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
        
        latitude.updateTitleAndSubtitle(title: "Latitude: ", subtitle: "")
        longitude.updateTitleAndSubtitle(title: "Longitude: ", subtitle: "")
        altitude.updateTitleAndSubtitle(title: "Altitude: ", subtitle: "")
        address.updateTitleAndSubtitle(title: "Address: ", subtitle: "")
        appleMapsLink.updateTitleAndSubtitle(title: "Apple Maps Link: ", subtitle: "")
        googleMapsLink.updateTitleAndSubtitle(title: "Google Maps Link: ", subtitle: "")
        referenceApp.updateTitleAndSubtitle(title: "Reference App: ", subtitle: "")
    
        verticalStackView.addArrangedSubview(latitude)
        verticalStackView.addArrangedSubview(longitude)
        verticalStackView.addArrangedSubview(altitude)
        verticalStackView.addArrangedSubview(address)
        verticalStackView.addArrangedSubview(appleMapsLink)
        verticalStackView.addArrangedSubview(googleMapsLink)
        verticalStackView.addArrangedSubview(referenceApp)
    }
}
