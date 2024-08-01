//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 11.07.2024.
//

import UIKit

extension PhotoLocationView {
    struct ViewModel {
        let altitude: CGFloat
        let address: String
        let coordinate: CGFloat
    }
}

class PhotoLocationView: UIView {
    
    private let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let altitudeView: PhotoDetailLocatoionView = {
        let view = PhotoDetailLocatoionView(title: "Altitude")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addressView: PhotoDetailLocatoionView = {
        let view = PhotoDetailLocatoionView(title: "Address")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let coordinatesView: PhotoDetailLocatoionView = {
        let view = PhotoDetailLocatoionView(title: "Coordinate")
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
    
    func updadate(with viewModel: ShareViewController.AddressViewModel) {
        addressView.updateSubtitle(viewModel.address)
        coordinatesView.updateSubtitle("\(viewModel.latitude), \(viewModel.longitude)")
        altitudeView.updateSubtitle(viewModel.altitude)
    }
    
}

private extension PhotoLocationView {
    
    func setup() {
        configureHorizontalStackView()
        configureAltitudeView()
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
    
    
    func configureAltitudeView() {
        horizontalStackView.addArrangedSubview(altitudeView)
        NSLayoutConstraint.activate([
         
        ])
    }
    
    func configureAddressView() {
        horizontalStackView.addArrangedSubview(addressView)
        NSLayoutConstraint.activate([
    
        ])
    }
    
    func configureCoordinatesView() {
        horizontalStackView.addArrangedSubview(coordinatesView)
        NSLayoutConstraint.activate([
 
        ])
    }

}
