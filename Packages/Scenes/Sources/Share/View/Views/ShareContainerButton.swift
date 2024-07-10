//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 02.07.2024.
//

import UIKit

final class ShareContainerButton: UIView {
    
    private let addPhotoButton: ShareButton = {
        let button = ShareButton(title: "Add Photo", image: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAddPhotoButtonTarget(_ target: Any?, action: Selector) {
        addPhotoButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

private extension ShareContainerButton {
    
    func setup() {
        configureAddPhotoButton()
        confifureAppearenceContainer()
    }
    
    func configureAddPhotoButton() {
        addSubview(addPhotoButton)
        NSLayoutConstraint.activate([
            addPhotoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addPhotoButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 141),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func confifureAppearenceContainer() {
        layer.cornerRadius = 32
        layer.borderWidth = 2
        layer.borderColor = UIColor(named: "lightBlue")?.cgColor
    }
}
