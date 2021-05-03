//
//  SelectionViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit

protocol SelectionViewControllerDelegate: AnyObject {
    
    func timerButtonPressed()
}

class SelectionViewController: UIViewController
{
    var selectionModel: SelectionViewModel!
    var selectionView: SelectionUIView!
    
    weak var delegate: SelectionViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .primaryColor()
        selectionModel = SelectionViewModel(self)
        selectionModel.delegate = self
        setNavBar()
        setViewWindow()
        
        
        if self.delegate == nil {
            print("NIL")
        }
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
            print("Hello2")
            self.delegate?.timerButtonPressed()
        }
    }
    
    
}


