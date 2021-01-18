//
//  SelectionViewCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit

final class SelectionViewCoordinator: Coordinator
{
    private(set) var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController)
    {
        self.navigationController = navigationController
    }
    
    func start() {
        let selectionViewController = SelectionViewController.instantiate("Main") as SelectionViewController
        navigationController.setViewControllers([selectionViewController], animated: false)
    }
    
    
}
