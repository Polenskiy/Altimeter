//
//
//
//  ShareViewController.swift
//	Where my children
//

import UIKit

final class ShareViewController: UIViewController {
    
    private var shareNavigationBar: ShareNavigationBar?
    
    private let addPhotoButton: ShareButton = {
        let button = ShareButton(title: "Add Photo", image: nil)
        return button
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
        configureAddPhotoButton()
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
    func configureAddPhotoButton() {
        view.addSubview(addPhotoButton)
        
        NSLayoutConstraint.activate([
            addPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 167),
            addPhotoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -557),
            addPhotoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 101),
            addPhotoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -101)
        ])
    }
    
    func configureShareContainerView() {
        view.addSubview(shareContainerView)
        NSLayoutConstraint.activate([
            shareContainerView.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 125),
            shareContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -388),
            shareContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            shareContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
    
        ])
    }
}
