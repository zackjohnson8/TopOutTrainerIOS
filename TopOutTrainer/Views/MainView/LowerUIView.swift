//
//  LowerUIView.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 6/1/21.
//

import Foundation
import UIKit

protocol LowerUIViewDelegate: AnyObject
{
    func addedLowerUIViewToWindow()
}

class LowerUIView: UIView
{
    var constraints_m: [NSLayoutConstraint]?
        
    weak var delegate: LowerUIViewDelegate?
        
    required override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = .primaryColor()
    }
        
    override func didMoveToWindow() {
        super.didMoveToWindow()
        delegate?.addedLowerUIViewToWindow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error: MainUIView init fatal error")
    }
}
