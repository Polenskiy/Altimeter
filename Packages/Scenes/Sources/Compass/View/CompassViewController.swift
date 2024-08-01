//
//
//
//  CompassViewController.swift
//	Where my children
//
import UIKit

extension CompassViewController {
    
    struct AddressViewModel {
        let latitude: String
        let longitude: String
        let address: String
    }
}

final class CompassViewController: UIViewController  {
    
    var output: CompassViewControllerOutput?
    let compassView: CompassView = CompassView()
    // MARK: - Functions
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "mapIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let locationContainerView: LocationContainerView = {
        let view = LocationContainerView()
        view.backgroundColor = UIColor(named: "lightBlue")
        view.layer.cornerRadius = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
        headingLabel.text = "0"
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
        headingLabel.text = "\(heading)"
    }
    
    func updateLocation(with viewModel: AddressViewModel) {
        locationContainerView.update(with: viewModel)
    }
    
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "darkBlue")
        configureCompassView()
        configureCancelButton()
        configureHeadingLabel()
        configureLocationContainerView()
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
            compassView.heightAnchor.constraint(equalToConstant: view.frame.width)
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
    
    func configureLocationContainerView() {
        view.addSubview(locationContainerView)
        NSLayoutConstraint.activate([
            locationContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            locationContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            locationContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            locationContainerView.topAnchor.constraint(greaterThanOrEqualTo: compassView.bottomAnchor)
        ])

    }
    
    func configureHeadingLabel() {
        view.addSubview(headingLabel)
        NSLayoutConstraint.activate([
            headingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headingLabel.bottomAnchor.constraint(equalTo: compassView.topAnchor, constant: -30)
        ])
    }
    
    @objc func backButtonPress() {
        output?.onBackButton()
    }
    
}
