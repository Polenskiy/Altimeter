//
//  LaunchErrorView.swift
//
//
//  Created by Vladimir Romashov on 19.05.2024.
//

import UIKit

final class LaunchErrorView: UIView {
    private let blurEffect: CustomVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let blurEffectView = CustomVisualEffectView(effect: blur, intensity: 0.1)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    private let titleView: LaunchTitleView = {
        let view = LaunchTitleView()
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
    
    func configure(with viewModel: LaunchPresenter.ViewModel) {
        titleView.configure(with: viewModel)
    }
}

private extension LaunchErrorView {
    func setup() {
        configureBlurEffect()
        configureTitleView()
    }
    
    func configureTitleView() {
        addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureBlurEffect() {
        addSubview(blurEffect)
        NSLayoutConstraint.activate([
            blurEffect.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurEffect.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurEffect.topAnchor.constraint(equalTo: topAnchor),
            blurEffect.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
