//
//
//
//  ShareViewController.swift
//	Where my children
//

import UIKit

final class ShareViewController: UIViewController {
    
    private var shareNavigationBar: ShareNavigationBar?
    
    private let containerButton = ShareContainerButton()
    
    private let сontainerView: ShareContainerView = {
        let view = ShareContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let photoLocationContainerView: PhotoLocationContainerView = {
        let view = PhotoLocationContainerView()
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
            self?.output?.cameraButtonTapped()
        }
        containerButton.setAddPhotoButtonTarget(self, action: #selector(addPhotoButtonTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shareNavigationBar?.configure(withTitle: "Share")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        shareNavigationBar?.resetAppearence()
        
    }
    
    @objc private func addPhotoButtonTapped() {
        output?.addPhotoButtonTapped()
    }
    
}

// MARK: - ShareViewControllerInput
extension ShareViewController: ShareViewControllerInput {
    func didChoose(image: UIImage) {
        containerButton.setButton(isHidden: true)
        confifurePhotoLocationContainerView()
        photoLocationContainerView.update(image: image)
    }
    
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "darkBlue")
    }
}

private extension ShareViewController {
    
    func configureContainerButton() {
        view.addSubview(containerButton)
        containerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            containerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerButton.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    func configureShareContainerView() {
        view.addSubview(сontainerView)
        NSLayoutConstraint.activate([
            сontainerView.topAnchor.constraint(equalTo: containerButton.bottomAnchor, constant: 32),
            сontainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            сontainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            сontainerView.heightAnchor.constraint(equalToConstant: 44),
    
        ])
    }
    
    func confifurePhotoLocationContainerView() {
        containerButton.addSubview(photoLocationContainerView)
        
        NSLayoutConstraint.activate([
            photoLocationContainerView.topAnchor.constraint(equalTo: containerButton.topAnchor),
            photoLocationContainerView.bottomAnchor.constraint(equalTo: containerButton.bottomAnchor),
            photoLocationContainerView.leadingAnchor.constraint(equalTo: containerButton.leadingAnchor),
            photoLocationContainerView.trailingAnchor.constraint(equalTo: containerButton.trailingAnchor)
        ])
    }
}
