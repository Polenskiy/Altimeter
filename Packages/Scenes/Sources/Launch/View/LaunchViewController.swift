//
//
//
//  LaunchViewController.swift
//	Where my children
//

import UIKit

class LaunchViewController: UIViewController {
    var output: LaunchViewControllerOutput?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launch_image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleView: LaunchTitleView = {
        let view = LaunchTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let errorView: LaunchErrorView = {
        let view = LaunchErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let blurEffect: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blur)
//        blurEffectView.alpha = 0.5
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
        }()
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
}

// MARK: - LaunchViewControllerInput
extension LaunchViewController: LaunchViewControllerInput {
    func setupInitialState() {
        configureBacgroundView()
        configureImageView()
        configureNormalState()
        configureErrorView()
    }
    
    func update(with state: LaunchPresenter.State) {
        switch state {
        case .normal:
            setNormalState(viewModel: state.viewModel)
        case .error:
            setErrorlState(viewModel: state.viewModel)
        }
    }
}

private extension LaunchViewController {
    func configureBacgroundView() {
        view.backgroundColor = UIColor(named: "darkBlue")
    }
    
    func configureImageView() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureNormalState() {
        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureErrorView() {
        blurEffect.contentView.addSubview(errorView)
        NSLayoutConstraint.activate([
            errorView.leadingAnchor.constraint(equalTo: blurEffect.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: blurEffect.trailingAnchor),
            errorView.topAnchor.constraint(equalTo: blurEffect.topAnchor),
            errorView.bottomAnchor.constraint(equalTo: blurEffect.bottomAnchor)
        ])
    }
    
    func configureBlurEffect() {
            view.addSubview(blurEffect)
            NSLayoutConstraint.activate([
                blurEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                blurEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                blurEffect.topAnchor.constraint(equalTo: view.topAnchor),
                blurEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    
    func setNormalState(viewModel: LaunchPresenter.ViewModel) {
        titleView.isHidden = false
        errorView.isHidden = true
        
        titleView.configure(with: viewModel)
    }
    
    func setErrorlState(viewModel: LaunchPresenter.ViewModel) {
        titleView.isHidden = true
        errorView.isHidden = false
        configureBlurEffect()
        errorView.configure(with: viewModel)
    }
}
