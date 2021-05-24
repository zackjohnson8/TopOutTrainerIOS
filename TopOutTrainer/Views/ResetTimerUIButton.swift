//
//  ResetTimerButton.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/23/21.
//
import Foundation
import UIKit

class ResetTimerUIButton: UIButton
{
    
    // Round button
    // Either has a play symbol |> or a pause symbol ||
    // Default to |>
    // Color and shadowing ... ***
    required init(width: CGFloat, height: CGFloat)
    {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = width * 0.5
        self.contentEdgeInsets = UIEdgeInsets(top: height/4, left: width/4, bottom: height/4, right: width/4)
        
        let image = UIImage(systemName: "arrow.counterclockwise", withConfiguration: UIImage.SymbolConfiguration(weight:.regular))
        self.setImage(image, for: .normal)
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.tintColor = .gray
        self.backgroundColor = .primaryColor()

    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
}
