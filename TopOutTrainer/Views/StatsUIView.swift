//
//  StatsUIView.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

class StatsUIView: UIView
{
    var parent: StatsViewController!
    
    required init(parent: StatsViewController)
    {
        super.init(frame: CGRect.zero)
        self.parent = parent
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("Fatal error in MainUIViewModel")
    }
    
    override func didMoveToWindow()
    {
        super.didMoveToWindow()
        self.backgroundColor = UIColor.primaryColor()
        
        setConstraints()
    }
    
    
}

private extension StatsUIView
{
    /**
     Summary: Setup self constraints
     */
    private func setConstraints()
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalTo: parent.view.widthAnchor, constant: 5).isActive = true
        self.heightAnchor.constraint(equalTo: parent.view.heightAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: parent.view.topAnchor, constant: 0).isActive = true
        self.centerXAnchor.constraint(equalTo: parent.view.centerXAnchor).isActive = true
    }
}
