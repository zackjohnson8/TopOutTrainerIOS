//
//  AppCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit

final class AppCordinator: Coordinator
{
    private(set) var childCoordinators: [Coordinator] = []
    
    private var window:UIWindow
    
    init (window: UIWindow)
    {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let selectionViewCoordinator = SelectionViewCoordinator(navigationController: navigationController)

        childCoordinators.append(selectionViewCoordinator as Coordinator)

        selectionViewCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
