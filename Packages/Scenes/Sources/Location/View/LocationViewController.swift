

import UIKit

final class LocationViewController: UIViewController {
    
    private var navigationBar: LocationNavigationBar?
    
    var output: LocationViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
        navigationBar = LocationNavigationBar(viewController: self) { }
        navigationBar?.configure(withTitle: "Share")
    }
    
}

// MARK: - LocationViewControllerInput
extension LocationViewController: LocationViewControllerInput {
    func setupInitialState() {
        view.backgroundColor = UIColor(named: "darkBlue")
    }
}
