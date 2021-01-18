//
//  SelectionUIViewModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/17/21.
//

import Foundation
import UIKit

class SelectionUIView: UIView
{
    
    var parent: UIViewController!
    var bgColor: UIColor!
    
    init(parent: UIViewController, bgColor: UIColor)
    {
        super.init(frame: CGRect.zero)
        self.parent = parent
        self.bgColor = bgColor
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatal error in SelectionUIViewModel")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        self.backgroundColor = bgColor
        
        setConstraints()
    }
    
    private func setConstraints()
    {
        // Handle with a height. These both should be consistent across all views created.
        #warning("Add these constraints")
    }
    
}
