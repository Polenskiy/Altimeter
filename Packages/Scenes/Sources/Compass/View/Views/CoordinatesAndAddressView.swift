//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 15.06.2024.
//

import UIKit

final class CoordinatesAndAddressView: UIView {
    
    private let coordinatesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CoordinatesAndAddressView {
    func setup() {
        backgroundColor = UIColor(named: "lightBlue")
        layer.cornerRadius = 32
        configureCoordinatesTitleLabel()
        configureAddressTitleLabel()
    }
    
    func configureCoordinatesTitleLabel() {
        addSubview(coordinatesTitleLabel)
        NSLayoutConstraint.activate([
            coordinatesTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            coordinatesTitleLabel.trailingAnchor.constraint(equalTo: centerXAnchor),
            coordinatesTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            coordinatesTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    func configureAddressTitleLabel() {
        addSubview(addressTitleLabel)
        NSLayoutConstraint.activate([
            addressTitleLabel.leadingAnchor.constraint(equalTo: coordinatesTitleLabel.trailingAnchor, constant: 10),
            addressTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            addressTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            addressTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
            
        ])
    }
}

extension CoordinatesAndAddressView {
    func updateCoordinates(_ coordinates: String) {
        coordinatesTitleLabel.text = "Coordinates: \(coordinates)"
    }
    
    func updateAddress(_ address: String) {
        addressTitleLabel.text = "Address: \(address)"
    }
}
