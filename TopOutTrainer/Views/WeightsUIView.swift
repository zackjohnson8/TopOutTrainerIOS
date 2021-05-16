//
//  weightsUIView.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

class WeightsUIView: UIView
{
    var parent: WeightsViewController!
    
    required init(parent: WeightsViewController)
    {
        super.init(frame: CGRect.zero)
        self.parent = parent
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("Fatal error in SelectionUIViewModel")
    }
    
    override func didMoveToWindow()
    {
        super.didMoveToWindow()
        self.backgroundColor = UIColor.primaryColor()
        
        setConstraints()
    }
    
    
}

private extension WeightsUIView
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
