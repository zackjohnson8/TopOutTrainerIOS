//
//  SelectionViewController.swift
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

protocol SelectionViewControllerDelegate: AnyObject {
    func selectionButtonPressed(event: Event)
}

final class SelectionViewController: UIViewController
{
    var selectionModel: SelectionViewModel!
    var selectionView: SelectionUIView!
    
    weak var delegate: SelectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .primaryColor()
        
        selectionModel = SelectionViewModel(self)
        selectionModel.delegate = self
        
        configUI()
    }
}

private extension SelectionViewController
{
    /**
     Summary: Handles calling all the configure UI functions
     */
    private func configUI()
    {
        setNavBar()
        setViewWindow()
    }

    /**
     Summary: Set the navigationItem's variables from the selectionModel
     */
    private func setNavBar()
    {
        self.navigationItem.rightBarButtonItem = selectionModel.rightBarItem
        self.navigationItem.title = selectionModel.title
        self.navigationController?.navigationBar.layer.cornerRadius = 20
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 40)!]
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /**
     Summary: Populate selectionView using containers stored in selectionModel. The UIView is used for displaying
     the selection buttons to navigate through the application. For example this might be a square timer button which displays
     a clock, creates a shadow of the same color that it is set to, and triggers a new UIViewController for the timer screen.
     */
    private func setViewWindow()
    {
        selectionView = selectionModel.selectionView
        self.view.addSubview(selectionView)
    }
    
}

extension SelectionViewController: SelectionViewModelDelegate
{
    func onSelectionButtonPressed(buttonType: ButtonType) {
        if buttonType == ButtonType.timer
        {
            print("SelectionViewModelDelegate call onSelectionButtonPressed")
            self.delegate?.selectionButtonPressed(event: .timer)
        }else
        if buttonType == ButtonType.stats
        {
            print("SelectionViewModelDelegate call onSelectionButtonPressed")
            self.delegate?.selectionButtonPressed(event: .stats)
        }else
        if buttonType == ButtonType.calendar
        {
            print("SelectionViewModelDelegate call onSelectionButtonPressed")
            self.delegate?.selectionButtonPressed(event: .calendar)
        }else
        if buttonType == ButtonType.weights
        {
            print("SelectionViewModelDelegate call onSelectionButtonPressed")
            self.delegate?.selectionButtonPressed(event: .weights)
        }else
        {
            print("Error: Could not find the correct selection button")
        }
    }
    
    
}


