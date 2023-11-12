//
//  AnimationManager.swift
//  Animations
//
//  Created by Davit Natenadze on 12.11.23.
//

import UIKit



class AnimationManager {
    
    static func startSlideAnimation(for label: UILabel) {
        let animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeOut) {
            label.alpha = 1
            label.transform = CGAffineTransform(translationX: 0, y: -60)
        }
        
        animator.addCompletion { _ in
            UIViewPropertyAnimator(duration: 1.8, curve: .easeIn) {
                label.alpha = 0
                label.transform = .identity
            }.startAnimation()
        }
        
        animator.startAnimation()
    }
    
    
    static func rotateLabel(label: UILabel, view: UIView) {
        scaleUpLabel(label: label)
        startGradientBackgroundAnimation(for: view)
        
        let initialTransform = label.transform
        let rotatedTransform = initialTransform.rotated(by: .pi)
        let counterRotatedTransform = rotatedTransform.rotated(by: -3.14)
        
       
        let animator = UIViewPropertyAnimator(duration: 2.5, curve: .linear) {
            label.transform = rotatedTransform
        }
        
        animator.addCompletion { _ in
            UIViewPropertyAnimator(duration: 2.5, curve: .linear) {
                label.transform = counterRotatedTransform
            }.startAnimation()
        }
        
        animator.startAnimation()
    }
    
    static func scaleUpLabel(label: UILabel) {
        label.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseIn, animations: {
            label.alpha = 1.0
            label.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    
    
    
    static func startGradientBackgroundAnimation(for view: UIView) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [UIColor.purple.cgColor, UIColor.red.cgColor]
        animation.toValue = [UIColor.yellow.cgColor, UIColor.green.cgColor]
        animation.duration = 3.0
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        
        gradientLayer.add(animation, forKey: "gradientAnimation")
    }
    
}
