//
//  LaunchErrorView.swift
//
//
//  Created by Vladimir Romashov on 19.05.2024.
//

import UIKit

final class LaunchErrorView: UIView {
//    private let bureView:
    
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
        addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
