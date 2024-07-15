//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 11.07.2024.
//

import UIKit

extension PhotoLocationContainerView {
    struct ViewModel {
        let photo: UIImage
        let altitude: CGFloat
        let address: String
        let coordinate: CGFloat
    }
}

final class PhotoLocationContainerView: UIView {
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = UIColor(named: "lightBlue")
        stack.layer.cornerRadius = 32
        stack.alignment = .center
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 32
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let photoLocationView: PhotoLocationView = {
        let view = PhotoLocationView()
        view.layer.cornerRadius = 32
        view.clipsToBounds = true
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
    
    func update(image: UIImage ) {
        photoImageView.image = image
    }
    
}

extension PhotoLocationContainerView {
    
    func setup() {
        configureVerticalStackView()
        configurePhotoImageView()
        configurePhotoLocationView()
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
    
    func configurePhotoImageView() {
        verticalStackView.addArrangedSubview(photoImageView)
        photoImageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        photoImageView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        NSLayoutConstraint.activate([
            
        ])
    }
    
    func configurePhotoLocationView() {
        verticalStackView.addArrangedSubview(photoLocationView)
        NSLayoutConstraint.activate([
            photoLocationView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            photoLocationView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor)
        ])
    }
}
