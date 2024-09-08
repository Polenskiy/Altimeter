//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 08.08.2024.
//

import UIKit

final class InformationContainerView: UIView {
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let inforamtionView = InformationView()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Altimeter information"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
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

private extension InformationContainerView {
    
    func setup() {
        configureAppearenceView()
        configureVerticalStackView()
        configureHeaderLabel()
        configureInforamtionView()
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
    
    func configureInforamtionView() {
        verticalStackView.addArrangedSubview(inforamtionView)
    }
    
    func configureHeaderLabel() {
        verticalStackView.addArrangedSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    func configureAppearenceView() {
        backgroundColor = UIColor(named: "lightBlue")
        layer.cornerRadius = 32
    }
}


