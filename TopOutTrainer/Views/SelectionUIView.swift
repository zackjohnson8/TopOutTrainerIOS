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
    var leftVerticalStack: UIStackView!
    var rightVerticalStack: UIStackView!
    var buttonColors: [UIColor] = [UIColor.green, UIColor.blue, UIColor.orange, UIColor.systemPink]
    var buttons: [SelectionUIButton] = []
    
    required init(parent: UIViewController)
    {
        super.init(frame: CGRect.zero)
        self.parent = parent
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatal error in SelectionUIViewModel")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setConstraints()
        createStacks()
        createButtons()
    }
    
    /**
     Summary: Setup self constraints
     */
    private func setConstraints()
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalTo: parent.view.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.heightAnchor).isActive = true
        self.topAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        self.centerXAnchor.constraint(equalTo: parent.view.centerXAnchor).isActive = true
    }
    
    /**
     Sumary: Create two vertical stacks that can hold the buttons
     */
    private func createStacks()
    {
        leftVerticalStack = UIStackView()
        leftVerticalStack.axis = .vertical
        leftVerticalStack.backgroundColor = .primaryColor()
        leftVerticalStack.distribution = .fillEqually
        
        rightVerticalStack = UIStackView()
        rightVerticalStack.axis = .vertical
        rightVerticalStack.backgroundColor = .primaryColor()
        rightVerticalStack.distribution = .fillEqually
        
        self.addSubview(leftVerticalStack)
        self.addSubview(rightVerticalStack)
        
        setStackConstraints()
    }
    
    /**
     Summary: Set the constraints for leftVerticalStack and rightVerticalStack
     */
    private func setStackConstraints()
    {
        leftVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        rightVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Left Vertical Stack
        leftVerticalStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        leftVerticalStack.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        leftVerticalStack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftVerticalStack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        // Right Vertical Stack
        rightVerticalStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        rightVerticalStack.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        rightVerticalStack.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rightVerticalStack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    /**
     Summary: Create and place the buttons into the appropriate stack view
     */
    private func createButtons()
    {
        
        for index in 0 ... (buttonColors.count - 1)
        {
            var newButton:SelectionUIButton? = nil
            let viewConstainer = UIView()
            viewConstainer.backgroundColor = .primaryColor()
            
            // Right Vertical Stack
            if(index % 2 == 0)
            {
                if(rightVerticalStack.arrangedSubviews.count == 0)
                {
                    newButton = SelectionUIButton(viewConstainer, buttonColors[index], .top)
                }else
                {
                    newButton = SelectionUIButton(viewConstainer, buttonColors[index], .bottom)
                }
                
                viewConstainer.addSubview(newButton!)
                rightVerticalStack.addArrangedSubview(viewConstainer)
            }else
            // Left Vertical Stack
            {

                if(leftVerticalStack.arrangedSubviews.count == 0)
                {
                    newButton = SelectionUIButton(viewConstainer, buttonColors[index], .top)
                }else
                {
                    newButton = SelectionUIButton(viewConstainer, buttonColors[index], .bottom)
                }
                
                viewConstainer.addSubview(newButton!)
                leftVerticalStack.addArrangedSubview(viewConstainer)
            }
        }        
        
    }
     
}
