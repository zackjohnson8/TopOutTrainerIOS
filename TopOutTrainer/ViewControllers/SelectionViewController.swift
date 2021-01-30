//
//  SelectionViewController.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit

class SelectionViewController: UIViewController
{
    var selectionModel: SelectionViewModel!
    var selectionView: SelectionUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .primaryColor()
        selectionModel = SelectionViewModel(self)
        setNavBar()
        
        setViewWindow()
    }
    
    /**
     Summary: Set the navigationItem's variables from the selectionModel
     */
    private func setNavBar()
    {
        navigationItem.rightBarButtonItem = selectionModel.rightBarItem
        navigationItem.title = selectionModel.title
        //navigationController?.navigationBar.barTintColor = .primaryColor() // Used if the prefersLargeTitles = false
        navigationController?.navigationBar.layer.cornerRadius = 20
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Georgia", size: 40)!]
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
