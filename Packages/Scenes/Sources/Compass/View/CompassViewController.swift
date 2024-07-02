//
//
//
//  CompassViewController.swift
//	Where my children
//

import UIKit

final class CompassViewController: UIViewController {
    
    var output: CompassViewControllerOutput?
    
    let compassView: CompassView = CompassView()
    // MARK: - Functions
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "mapIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

// MARK: - CompassViewControllerInput
extension CompassViewController: CompassViewControllerInput {
    func update(heading: CGFloat) {
        compassView.heading = heading
    }
    
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "darkBlue")
        configureCompassView()
        configureCancelButton()
    }
}

private extension CompassViewController {
    
    func configureCompassView() {
        view.addSubview(compassView)
        compassView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compassView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            compassView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            compassView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            compassView.heightAnchor.constraint(equalToConstant: view.frame.width - 32)
        ])
    }
    
    func configureCancelButton() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 60),
            backButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        backButton.addTarget(self, action: #selector(backButtonPress), for: .touchUpInside)
    }
    
    @objc func backButtonPress() {
        output?.onBackButton()
    }
    
}
