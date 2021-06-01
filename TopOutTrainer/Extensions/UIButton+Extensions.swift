//
//  UIButton+Extensions.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/10/21.
//

import UIKit

extension UIButton {
    
    /**
     Summary: I wanted an extension to UIButton to apply a gradient to the main buttons on the root screen
     */
    func applyGradient(colors: [CGColor]) {
            self.backgroundColor = nil
            self.layoutIfNeeded()
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = colors
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = self.frame.height/2

            gradientLayer.shadowColor = UIColor.darkGray.cgColor
            gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
            gradientLayer.shadowRadius = 5.0
            gradientLayer.shadowOpacity = 0.3
            gradientLayer.masksToBounds = false

            self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
