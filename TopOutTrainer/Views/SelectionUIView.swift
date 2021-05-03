//
//  SelectionUIViewModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/17/21.
//

import Foundation
import UIKit

protocol SelectionUIViewDelegate: AnyObject
{
    func onTimerButtonPressed()
    func onWeightsButtonPressed()
    func onStatsButtonPressed()
    func onCalendarButtonPressed()
}

class SelectionUIView: UIView
{
    
    var parent: SelectionViewController!
    var leftVerticalStack: UIStackView!
    var rightVerticalStack: UIStackView!
    var buttonColors: [UIColor] = [UIColor.selectionGreen(), UIColor.blue, UIColor.orange, UIColor.systemPink]
    var buttons: [SelectionUIButton] = []
    
    weak var delegate: SelectionUIViewDelegate?
    
    enum ButtonType
    {
        case dumbbell
        case calendar
        case stopwatch
        case chart
    }
    
    required init(parent: SelectionViewController)
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
        
        self.widthAnchor.constraint(equalTo: parent.view.widthAnchor, constant: 5).isActive = true
        self.heightAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.heightAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
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
        leftVerticalStack.layer.cornerRadius = 30
        leftVerticalStack.layer.maskedCorners = [.layerMinXMinYCorner]
        
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
                    let image = UIImageView(image: UIImage(named: "Dumbbell"))
                    image.backgroundColor = buttonColors[index]
                    newButton = SelectionUIButton(viewConstainer, buttonColors[index], .top, image)
                    
                    let buttonGesture = UITapGestureRecognizer(target: self, action: #selector(dumbbellButtonPressed))
                    newButton?.addGestureRecognizer(buttonGesture)
                }else
                {
                    let image = UIImageView(image: UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))!)
                    newButton = SelectionUIButton(viewConstainer, buttonColors[index], .bottom, image)
                    
                    let buttonGesture = UITapGestureRecognizer(target: self, action: #selector(calendarButtonPressed))
                    newButton?.addGestureRecognizer(buttonGesture)
                }
                
                viewConstainer.addSubview(newButton!)
                rightVerticalStack.addArrangedSubview(viewConstainer)
            }else
            // Left Vertical Stack
            {
                if(leftVerticalStack.arrangedSubviews.count == 0)
                {
                    let image = UIImageView(image: UIImage(systemName: "stopwatch", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))!)
                    newButton = SelectionUIButton(viewConstainer, buttonColors[index], .top, image)
                    
                    let buttonGesture = UITapGestureRecognizer(target: self, action: #selector(stopwatchButtonPressed))
                    newButton?.addGestureRecognizer(buttonGesture)
                }else
                {
                    let image = UIImageView(image: UIImage(systemName: "chart.bar.xaxis", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))!)
                    newButton = SelectionUIButton(viewConstainer, buttonColors[index], .bottom, image)
                    
                    let buttonGesture = UITapGestureRecognizer(target: self, action: #selector(chartButtonPressed))
                    newButton?.addGestureRecognizer(buttonGesture)
                }
                
                viewConstainer.addSubview(newButton!)
                leftVerticalStack.addArrangedSubview(viewConstainer)
            }
        }
    }

    
    @objc func dumbbellButtonPressed()
    {
        #warning("TODO")
    }
    
    @objc func calendarButtonPressed()
    {
        #warning("TODO")
    }
    
    @objc func stopwatchButtonPressed(sender: UITapGestureRecognizer)
    {
        //let timerWindow = TimerViewCoordinator.init(navigationController: parent.navigationController!)
        //timerWindow.start()
        //parent.navigationController.didSelect
        print("hello")
        self.delegate?.onTimerButtonPressed()
        
    }
    
    @objc func chartButtonPressed()
    {
        #warning("TODO")
    }
}

