//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 28.06.2024.
//

import UIKit

final class ShareContainerView: UIView {
    
    var photoButtonHandler: (() -> Void)?
    var locationButtonHandler: (() -> Void)?
    
    private let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let shareButton = ShareButton(title: "Share", image: UIImage(named: "photoIcon"))
    private let locationButton = ShareButton(title: "Location", image: UIImage(named: "locationIcon"))
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ShareContainerView {
    
    func setup() {
        configureHorizontalStackView()
        configureButtons()
        shareButton.addTarget(self, action: #selector(photoButtonTapped), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
    }
    
    @objc func photoButtonTapped() {
        photoButtonHandler?()
    }
    
    @objc func locationButtonTapped() {
        locationButtonHandler?()
    }
    
    func configureHorizontalStackView() {
        addSubview(horizontalStackView)
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    func configureButtons() {
        horizontalStackView.addArrangedSubview(shareButton)
        horizontalStackView.addArrangedSubview(locationButton)
        
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            shareButton.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
            locationButton.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            locationButton.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor),
        ])
    }
}

