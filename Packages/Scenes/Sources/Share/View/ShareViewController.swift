//
//
//
//  ShareViewController.swift
//	Where my children
//

import UIKit

extension ShareViewController {
    
    struct AddressViewModel {
        let altitude: String
        let latitude: String
        let longitude: String
        let address: String
    }
}

final class ShareViewController: UIViewController {
    
    private var navigationBar: ShareNavigationBar?
    
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
        configureContainerView()
        navigationBar = ShareNavigationBar(viewController: self) { [weak self] in
            self?.output?.cameraButtonTapped()
        }
        containerButton.addPhotoButtonHandler = { [weak self] in
            self?.output?.addPhotoButtonTapped()
        }
        сontainerView.locationButtonHandler = { [weak self] in
            self?.output?.locationButtonTapped()
        }
        сontainerView.photoButtonHandler = { }
        navigationBar?.configure(withTitle: "Share")
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
    
    func updateLocation(with viewModel: AddressViewModel) {
        photoLocationContainerView.updadateLocation(with: viewModel)
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
    
    func configureContainerView() {
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
