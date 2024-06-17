//
//
//
//  CompassViewController.swift
//	Where my children
//
import CoreLocation
import UIKit
import Services

final class CompassViewController: UIViewController  {
    
    var output: CompassViewControllerOutput?
    
    let locationListener: LocationListenerProtocol = LocationListener()
    let compassView: CompassView = CompassView()
    // MARK: - Functions
    
    private let locationManager = CLLocationManager()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "mapIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    private let coordinatsAndAddresView: CoordinatesAndAddressView = {
       let view = CoordinatesAndAddressView()
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
        setupLocationListener()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func updateCoordinatesAndAddress(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self, let placemark = placemarks?.first, error == nil else { return }
            let address = [placemark.thoroughfare, placemark.locality, placemark.country].compactMap { $0 }.joined(separator: ", ")
            DispatchQueue.main.async {
                self.coordinatsAndAddresView.updateCoordinates("\(location.coordinate.latitude), \(location.coordinate.longitude)")
                self.coordinatsAndAddresView.updateAddress(address)
            }
        }
    }
    
    private func setupLocationListener() {
        locationListener.startUpdatingLocation { location in
            guard let location = location else { return }
            self.updateCoordinatesAndAddress(location: location)
        }
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
        configureTitleView()
        configureHeadingLabel()
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
    
    func configureTitleView() {
        view.addSubview(coordinatsAndAddresView)
        NSLayoutConstraint.activate([
            coordinatsAndAddresView.topAnchor.constraint(equalTo: compassView.bottomAnchor, constant: 5),
            coordinatsAndAddresView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            coordinatsAndAddresView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coordinatsAndAddresView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            coordinatsAndAddresView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func configureHeadingLabel() {
        view.addSubview(headingLabel)
        NSLayoutConstraint.activate([
            headingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
        updateHeadingLabel()
    }
    
    func updateHeadingLabel() {
        let headingDegrees = Int(compassView.heading)
        headingLabel.text = "\(headingDegrees)°"

    }
    
    @objc func backButtonPress() {
        output?.onBackButton()
    }
    
}
