//
//  PlayPauseUIButton.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/17/21.
//
import Foundation
import UIKit

class PlayPauseUIButton: UIButton
{
    
    public var width_m: CGFloat!
    public var height_m: CGFloat!
    
    // Round button
    // Either has a play symbol |> or a pause symbol ||
    // Default to |>
    // Color and shadowing ... ***
    required init(width: CGFloat, height: CGFloat)
    {
        super.init(frame: .zero)
        
        self.width_m = width
        self.height_m = height
        
        setUI()
        setShadow()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI()
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = width_m! * 0.5
        self.contentEdgeInsets = UIEdgeInsets(top: height_m/4, left: width_m/4, bottom: height_m/4, right: width_m/4)

        let image = UIImage(systemName: "play", withConfiguration: UIImage.SymbolConfiguration(weight:.regular))
        self.setImage(image, for: .normal)
        
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.tintColor = .gray
        self.backgroundColor = .primaryColor()
        
        self.setNeedsLayout()
    }
    
    private func setShadow()
    {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = .init(width: 0.0, height: 0.0)
        self.layer.shadowRadius = width_m * 0.3
        self.layer.shadowOpacity = 1.0
        
        self.setNeedsLayout()
    }
    
    public func buttonPressedDown()
    {
        self.layer.shadowOffset = .init(width: 2.0, height: 2.0)
        self.layer.shadowRadius = width_m * 0.2
    }
    
    public func buttonReleased()
    {
        self.layer.shadowOffset = .init(width: 0.0, height: 0.0)
        self.layer.shadowRadius = width_m * 0.3
        self.layer.cornerRadius = width_m * 0.5
    }
    
    public func buttonCancel()
    {
        self.layer.shadowOffset = .init(width: 0.0, height: 0.0)
        self.layer.shadowRadius = width_m * 0.3
        self.layer.cornerRadius = width_m * 0.5
    }
}
