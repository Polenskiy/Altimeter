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
    
         if let navigationController = viewController?.navigationController {
            
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
        
        if #available(iOS 14.0, *) {
            
            let cameraImage = UIImage(named: "cameraIcon")
            let rightButton = UIBarButtonItem(image: cameraImage, style: .plain, target: self, action: #selector(onAction))
            rightButton.tintColor = UIColor.white
            viewController?.navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    func resetAppearence() {
        viewController?.navigationController?.navigationBar.backgroundColor = nil
    }
    
    @objc private func onAction() {
        actionHandler()
    }
}



