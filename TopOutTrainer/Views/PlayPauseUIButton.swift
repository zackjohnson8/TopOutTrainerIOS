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
    
    // Round button
    // Either has a play symbol |> or a pause symbol ||
    // Default to |>
    // Color and shadowing ... ***
    required init(width: CGFloat, height: CGFloat)
    {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setImage(UIImage(systemName: "play", withConfiguration: UIImage.SymbolConfiguration(weight:.regular)), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: height / 10, left: width / 10, bottom: height / 10, right: width / 10)
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.tintColor = .gray
        self.backgroundColor = .primaryColor()
        self.layer.cornerRadius = width * 0.5

    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PlayPauseUIButton
{
    public func setConstraints(label: UILabel)
    {
        self.
        
        self.widthAnchor.constraint(equalTo: self.superview.widthAnchor, multiplier: 0.2).isActive = true
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        self.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
}
