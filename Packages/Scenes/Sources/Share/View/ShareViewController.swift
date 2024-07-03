//
//
//
//  ShareViewController.swift
//	Where my children
//

import UIKit

final class ShareViewController: UIViewController {
    
    private var shareNavigationBar: ShareNavigationBar?
    
    private let containerButton: ShareContainerButton = {
        let view = ShareContainerButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shareContainerView: ShareContainerView = {
        let view = ShareContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var output: ShareViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
        configureContainerButton()
        configureShareContainerView()
        shareNavigationBar = ShareNavigationBar(viewController: self) { [weak self] in
            print("")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shareNavigationBar?.configure(withTitle: "Share")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        shareNavigationBar?.resetAppearence()
        
    }
    
}

// MARK: - ShareViewControllerInput
extension ShareViewController: ShareViewControllerInput {
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "darkBlue")
    }
}

private extension ShareViewController {
    
    func configureContainerButton() {
        view.addSubview(containerButton)
        NSLayoutConstraint.activate([
            containerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            containerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerButton.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    func configureShareContainerView() {
        view.addSubview(shareContainerView)
        NSLayoutConstraint.activate([
            shareContainerView.topAnchor.constraint(equalTo: containerButton.bottomAnchor, constant: 32),
            shareContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            shareContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            shareContainerView.heightAnchor.constraint(equalToConstant: 44),
    
        ])
    }
}
