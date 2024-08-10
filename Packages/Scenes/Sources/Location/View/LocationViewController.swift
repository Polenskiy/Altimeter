

import UIKit

final class LocationViewController: UIViewController {
    
    private var navigationBar: LocationNavigationBar?
    
    private let informationContainerView: InformationContainerView = {
        let view = InformationContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var output: LocationViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
        navigationBar = LocationNavigationBar(viewController: self) { }
        navigationBar?.configure(withTitle: "Share")
        setup()
    }
}

// MARK: - LocationViewControllerInput
extension LocationViewController: LocationViewControllerInput {
    
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "darkBlue")
    }
}

private extension LocationViewController {
    
    func setup() {
        configureInformationContainerView()
    }
    
    func configureInformationContainerView() {
        view.addSubview(informationContainerView)
        NSLayoutConstraint.activate([
            informationContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 118),
            informationContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            informationContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            informationContainerView.heightAnchor.constraint(equalToConstant: 406),
        ])
    }
}
