//
//  ControlsView.swift
//
//
//  Created by Vladimir Romashov on 01.06.2024.
//

import UIKit

extension ControlsView {
    enum ControlType {
        
        typealias Completion = (Self) -> Void
        
        case compass(Completion)
        case share(Completion)
        case layers(Completion)
        case menu(Completion)
        case position(Completion)
        
        var imageName: String {
            switch self {
            case .compass:
                return "compassIcon"
            case .share:
                return "shareIcon"
            case .layers:
                return "layersIcon"
            case .menu:
                return "menuIcon"
            case .position:
                return "positionIcon"
            }
        }
        
        var handler: Completion {
            switch self {
            case .compass(let handler),
                    .share(let handler),
                    .layers(let handler),
                    .menu(let handler),
                    .position(let handler):
                return handler
            }
        }
    }
}

final class ControlsView: UIView {
    func configure(with types: [ControlType]) {
        types.forEach { configure(with: $0) }
    }
}

private extension ControlsView {
    func configure(with type: ControlType) {
        let control = makeControlButton(with: type)
        switch type {
        case .compass:
            setupCompass(control: control)
        case .share:
            setupShare(control: control)
        case .layers:
            setupLayers(control: control)
        case .menu:
            setupMenu(control: control)
        case .position:
            setupPosition(control: control)
        }
    }
    
    
    func makeControlButton(with type: ControlType) -> ControlButton {
        let button = ControlButton()
        button.configure(type: type)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupCompass(control: ControlButton) {
        addSubview(control)
        NSLayoutConstraint.activate([
            control.trailingAnchor.constraint(equalTo: trailingAnchor),
            control.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    func setupShare(control: ControlButton) {
        addSubview(control)
        NSLayoutConstraint.activate([
            control.leadingAnchor.constraint(equalTo: leadingAnchor),
            control.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
        ])
    }
    
    func setupLayers(control: ControlButton) {
        addSubview(control)
        NSLayoutConstraint.activate([
            control.leadingAnchor.constraint(equalTo: leadingAnchor),
            control.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func setupMenu(control: ControlButton) {
        addSubview(control)
        NSLayoutConstraint.activate([
            control.trailingAnchor.constraint(equalTo: trailingAnchor),
            control.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
        ])
    }
    func setupPosition(control: ControlButton) {
        addSubview(control)
        NSLayoutConstraint.activate([
            control.trailingAnchor.constraint(equalTo: trailingAnchor),
            control.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

final class ControlButton: UIButton {
    private var handler: ((ControlsView.ControlType) -> Void)?
    private var type: ControlsView.ControlType?
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(type: ControlsView.ControlType) {
        setImage(UIImage(named: type.imageName), for: .normal)
        self.handler = type.handler
        self.type = type
    }
}

private extension ControlButton {
    func configure() {
        addTarget(self, action: #selector(onTap), for: .touchUpInside)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60),
            widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func onTap() {
        guard let type else {
            return
        }
        handler?(type)
    }
}
