//
//  LocationNavigationBar.swift
//  
//
//  Created by Daniil Polenskii on 06.08.2024.
//

import UIKit

class LocationNavigationBar {

    private weak var viewController: UIViewController?
    private let actionHandler: () -> Void
    
    init(viewController: UIViewController?, actionHandler: @escaping () -> Void) {
        self.viewController = viewController
        self.actionHandler = actionHandler
    }
    
    func configure(withTitle title: String) {
        guard let navigationController = viewController?.navigationController else { return
        }
        configureAppearence(for: navigationController, title: title)
    }
}

private extension LocationNavigationBar {
    func configureAppearence(for navigationController: UINavigationController, title: String ) {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(named: "lightBlue")
            
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23)
            ]
            
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.compactAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        }
        navigationController.navigationBar.tintColor = UIColor.white
        viewController?.navigationItem.title = title
    }

}
