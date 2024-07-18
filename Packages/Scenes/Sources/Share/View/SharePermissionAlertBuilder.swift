//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 18.07.2024.
//

import UIKit

struct SharePermissionAlertBuilder {
    
    func getPermissionAlert() -> UIAlertController {
        let alert = UIAlertController(
            title: "Доступ к галерее",
            message: "Для добавления фото необходимо предоставить доступ к галерее. Вы можете сделать это в настройках",
            preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { _ in
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.open(settingsURL)
            }
        }
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        return alert
    }
}
