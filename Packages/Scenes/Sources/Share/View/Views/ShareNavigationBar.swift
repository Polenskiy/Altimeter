//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 01.07.2024.
//

import UIKit

final class ShareNavigationBar {
    
    private weak var viewController: UIViewController?
    private let actionHandler: () -> Void
    
    init(viewController: UIViewController, onActionButton: @escaping () -> Void) {
        self.viewController = viewController
        self.actionHandler = onActionButton
    }
    
     func configure(withTitle title: String) {
         guard let navigationController = viewController?.navigationController else {
             return
         }
         
         configureAppearence(for: navigationController, title: title)
         configureNavigationBarItems()
    }
}

private extension ShareNavigationBar {
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
    
    func configureNavigationBarItems() {
            let cameraImage = UIImage(named: "cameraIcon")
            let rightButton = UIBarButtonItem(image: cameraImage, style: .plain, target: self, action: #selector(onAction))
            viewController?.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func onAction() {
        actionHandler()
    }
}
