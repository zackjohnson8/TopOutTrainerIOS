//
//  MainViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit

public enum Event {
    case timer,
         weights,
         stats,
         calendar
}

protocol MainViewControllerDelegate: AnyObject {
    func mainButtonPressed(event: Event)
}

final class MainViewController: UIViewController
{
    var mainModel: MainViewModel!
    var mainView: MainUIView!
    
    weak var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .primaryColor()
        
        setViewModel()
        setUI()
    }
}

private extension MainViewController
{
    /**
     Summary: Handles calling all the configure UI functions
     */
    private func setUI()
    {
        self.view.layoutIfNeeded()
        setNavBar()
        setViewWindow()
    }

    /**
     Summary: Set the navigationItem's variables from the mainModel
     */
    private func setNavBar()
    {
        self.navigationItem.rightBarButtonItem = mainModel.rightBarItem
        self.navigationItem.title = mainModel.title
    }
    
    /**
     Summary: Populate mainView using containers stored in mainModel. The UIView is used for displaying
     the main buttons to navigate through the application. For example this might be a square timer button which displays
     a clock, creates a shadow of the same color that it is set to, and triggers a new UIViewController for the timer screen.
     */
    private func setViewWindow()
    {
        mainView = mainModel.mainView
        self.view.addSubview(mainView)
    }
    
    private func setViewModel()
    {
        mainModel = MainViewModel(self)
        mainModel.delegate = self
    }
    
}

extension MainViewController: MainViewModelDelegate
{
    func onMainButtonPressed(buttonType: ButtonType) {
        if buttonType == ButtonType.timer
        {
            print("MainViewModelDelegate call onMainButtonPressed")
            self.delegate?.mainButtonPressed(event: .timer)
        }else
        if buttonType == ButtonType.stats
        {
            print("MainViewModelDelegate call onMainButtonPressed")
            self.delegate?.mainButtonPressed(event: .stats)
        }else
        if buttonType == ButtonType.calendar
        {
            print("MainViewModelDelegate call onMainButtonPressed")
            self.delegate?.mainButtonPressed(event: .calendar)
        }else
        if buttonType == ButtonType.weights
        {
            print("MainViewModelDelegate call onMainButtonPressed")
            self.delegate?.mainButtonPressed(event: .weights)
        }else
        {
            print("Error: Could not find the correct main button")
        }
    }
    
    
}


