

import UIKit

final class LocationViewController: UIViewController {
    
    var output: LocationViewControllerOutput?
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didTriggerViewReadyEvent()
    }
    
}

// MARK: - LocationViewControllerInput
extension LocationViewController: LocationViewControllerInput {
    func setupInitialState() {
    }    
}
