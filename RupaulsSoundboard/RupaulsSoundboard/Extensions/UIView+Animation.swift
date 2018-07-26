//
//  UIView+Animation.swift
//  GCSoundboard
//
//  Created by Kieran Foley on 28/06/2018.
//  Copyright © 2018 Kieran. All rights reserved.
//

import UIKit

// Extends UIView for animations
extension UIView {
    
    func spin() {
        UIView.animate(withDuration: 1.5, animations: {
            var rotationAnimation = CABasicAnimation()
            rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
            rotationAnimation.toValue = NSNumber(value: (Double.pi*2))
            rotationAnimation.duration = 0.75
            rotationAnimation.isCumulative = true
            self.layer.add(rotationAnimation, forKey: "rotationAnimation")
        })
    }
    
    func pulse() {
        UIView.animate(withDuration:0, delay: 0, options: [] ,animations: {
            self.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0, delay: 0, options: [], animations: {
                self.alpha = 0.3
            }){ _ in
                UIView.animate(withDuration: 0.25, delay: 0, options: [], animations: {
                    self.alpha = 1
                })
            }
        }
    }
}
