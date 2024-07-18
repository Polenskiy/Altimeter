//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 20.06.2024.
//

import UIKit

final class LocationView: UIView {
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .top
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "skyBlue")
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSubtitle(_ subtitle: String) {
          subtitleLabel.text = subtitle
      }
}

extension LocationView {
    
    func setup() {
        configureVerticalStackView()
        configureTitleLabel()
        configureSubtitleLabel()
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
    
    func configureTitleLabel() {
        verticalStackView.addArrangedSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: verticalStackView.topAnchor)
        ])
    }
    
    func configureSubtitleLabel() {
        verticalStackView.addArrangedSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor)

        ])
    }
}
