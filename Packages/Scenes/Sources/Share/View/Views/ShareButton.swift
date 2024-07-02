//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 23.06.2024.
//

import UIKit

final class ShareButton: UIButton {
    
    init(title: String, image: UIImage?) {
        super.init(frame: .zero)
        setup(with: title, image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ShareButton {
    
    func setup(with title: String, image: UIImage?) {
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        backgroundColor = UIColor(named: "lightBlue")
        setTitleColor(.white, for: .normal)
        setTitleColor(.gray, for: .highlighted)
        layer.cornerRadius = 16
        translatesAutoresizingMaskIntoConstraints = false
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
}

