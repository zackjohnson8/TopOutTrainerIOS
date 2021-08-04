//
//  UIColor+Extensions.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/23/21.
//

import Foundation
import UIKit

public extension UIColor
{
    static func primaryColor() -> UIColor
    {
        return UIColor.systemGray2
    }
    
    static func secondaryColor() -> UIColor
    {
        return UIColor.systemGray5
    }
    
    static func mainGreen() -> UIColor
    {
        return UIColor(red: 0/255, green: 199/255, blue: 9/255, alpha: 1.0)
    }

    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
    
}
