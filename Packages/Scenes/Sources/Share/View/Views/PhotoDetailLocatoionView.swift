//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 14.07.2024.
//

import UIKit

final class PhotoDetailLocatoionView: UIView {
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "skyBlue")
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
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
        setup()
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSubtitle(_ subtitle: String) {
          subtitleLabel.text = subtitle
      }
}

private extension PhotoDetailLocatoionView {
    
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

