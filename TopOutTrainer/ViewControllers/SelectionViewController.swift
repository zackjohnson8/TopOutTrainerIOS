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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionModel = SelectionViewModel(self as UIViewController)
        
        setupNavBar()
        setupViewWindow()
    }
    
    private func setupNavBar()
    {
        navigationItem.rightBarButtonItem = selectionModel.rightBarItem
        navigationItem.title = selectionModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupViewWindow()
    {
        for view in selectionModel.selectionViews
        {
            self.view.addSubview(view)
        }
    }
    
    
    
}
