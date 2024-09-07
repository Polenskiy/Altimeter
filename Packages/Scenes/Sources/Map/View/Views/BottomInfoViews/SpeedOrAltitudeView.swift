//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 11.08.2024.
//

import UIKit

final class SpeedOrAltitudeView: UIView {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
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

private extension SpeedOrAltitudeView {
    
    func setup() {
        configureAppearenceView()
        configureTextLabel()
    }
    
    func configureTextLabel() {
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureAppearenceView() {
        backgroundColor = .black
        layer.cornerRadius = 16
        
    }
}

extension SpeedOrAltitudeView {
    func configure(with title: String) {
        textLabel.text = title
    }
}
