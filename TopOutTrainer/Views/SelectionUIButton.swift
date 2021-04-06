//
//  SelectionUIButtons.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/23/21.
//

import Foundation
import UIKit

class SelectionUIButton: UIButton
{
    public enum ARRANGEMENT {
        case top
        case bottom
    }
    
    var parent: UIView!
    var bgColor: UIColor!
    var arrangement: ARRANGEMENT!
    var bgImage: UIImageView!
    
    required init(_ parent: UIView,_ bgColor: UIColor,_ arrangement: ARRANGEMENT,_ bgImage: UIImageView)
    {
        super.init(frame: CGRect.zero)
        
        self.parent = parent
        self.bgColor = bgColor
        self.arrangement = arrangement
        self.bgImage = bgImage
        
        self.layer.cornerRadius = 10
        self.backgroundColor = bgColor
        self.tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        setConstraints()
        setShadow()
        setBGImage()
    }
    
    /**
     Summary: Sets the buttons shadow to be bottom right area. This shadow is also the same color of the button.
     */
    private func setShadow()
    {
        self.layer.shadowColor = bgColor.cgColor
        self.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
    }
    
    /**
     Summary: Sets the background image of the image.
     */
    private func setBGImage()
    {
        self.addSubview(bgImage)
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        bgImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        bgImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        bgImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bgImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setConstraints()
    {
        if(arrangement == .top)
        {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.85).isActive = true
            self.heightAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 1.0).isActive = true
            self.centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
            self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        }
        
        if(arrangement == .bottom)
        {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.85).isActive = true
            self.heightAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 1.0).isActive = true
            self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
            self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        }
    }
    
}

