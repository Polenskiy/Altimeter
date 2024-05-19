//
//  LaunchTitleView.swift
//
//
//  Created by Vladimir Romashov on 19.05.2024.
//

import UIKit

extension LaunchTitleView {
    struct ViewModel {
        let title: String
        let shouldShowBorder: Bool
    }
}

final class LaunchTitleView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
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
    
    func configure(with viewModel: LaunchPresenter.ViewModel) {
        titleLabel.text = viewModel.title
        if viewModel.shouldShowBorder {
            layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
            layer.borderWidth = 1
        }
    }
}

private extension LaunchTitleView {
    func setup() {
        backgroundColor = UIColor(named: "lightBlue")
        layer.cornerRadius = 16
        
        configureTitleLabel()
    }
    
    func configureTitleLabel() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
