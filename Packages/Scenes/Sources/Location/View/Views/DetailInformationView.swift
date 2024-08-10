//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 10.08.2024.
//

import UIKit

final class DetailInformationView: UIView {
    
    private let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
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
}

private extension DetailInformationView {
    
    func setup() {
        configureHorizontalStackView()
        configureTitleLabel()
        configureSubtitleLabel()
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
    
    func configureTitleLabel() {
        horizontalStackView.addArrangedSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: horizontalStackView.topAnchor)
        ])
    }
    
    func configureSubtitleLabel() {
        horizontalStackView.addArrangedSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            titleLabel.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: horizontalStackView.topAnchor)
        ])
    }
}
