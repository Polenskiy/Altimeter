//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 05.07.2024.
//

import UIKit

public class ShareCustomVisualEffectView: UIVisualEffectView {
    
    private let theEffect: UIVisualEffect
    private let customIntensity: CGFloat
    private var animator: UIViewPropertyAnimator?
    
    public init(effect: UIVisualEffect, intensity: CGFloat) {
        theEffect = effect
        customIntensity = intensity
        super.init(effect: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    deinit {
        animator?.stopAnimation(true)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        effect = nil
        animator?.stopAnimation(true)
        
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.effect = theEffect
        }
        animator?.fractionComplete = customIntensity
    }
}
