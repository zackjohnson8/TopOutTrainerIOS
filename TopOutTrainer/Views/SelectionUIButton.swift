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
    
    required init(_ parent: UIView,_ bgColor: UIColor,_ arrangement: ARRANGEMENT)
    {
        super.init(frame: CGRect.zero)
        self.parent = parent
        self.bgColor = bgColor
        self.arrangement = arrangement
        
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        self.backgroundColor = bgColor
        setConstraints()
    }
    
    private func setConstraints()
    {
        if(arrangement == .top)
        {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.90).isActive = true
            self.heightAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.90).isActive = true
            self.centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
            self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        }
        
        if(arrangement == .bottom)
        {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.90).isActive = true
            self.heightAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 0.90).isActive = true
            self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
            self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        }
    }
    
}

