//
//  SelectionViewCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit


class SelectionViewCoordinator: NavigationCoordinator
{
    var childCoordinators: [Coordinator] = []
    var navigator: NavigatorType
    var rootViewController: UINavigationController
    
    private let selectionViewController: SelectionViewController
    
    init()
    {
        let selectionViewController = SelectionViewController()
        self.selectionViewController = selectionViewController
        
        let navigationController = UINavigationController(rootViewController: selectionViewController)
        self.navigator = Navigator(navigationController: navigationController)
        self.rootViewController = navigationController
    }

    func start()
    {
        selectionViewController.delegate = self
    }
        
}

extension SelectionViewCoordinator: SelectionViewControllerDelegate {
    func timerButtonPressed() {
        print("Hello Zack, glad to see you've finally done it")
    }
}

//extension SelectionViewCoordinator: {
//
//    public func selectionTimerButtonDidPress(_ viewController: SelectionViewController)
//    {
//        // TODO: - Write this
//    }
//}

//    private var timerViewCoordinator: TimerViewCoordinator?
//
//    init(navigationController: UINavigationController)
//    {
//        self.navigationController = navigationController
//    }
//
//    func start() {
//        let selectionViewController = SelectionViewController.instantiate("Main") as SelectionViewController
//        navigationController!.pushViewController(selectionViewController, animated: true)
//    }
//
//    func didSelectTimerButton()
//    {
//        let timerViewCoordinator = TimerViewCoordinator(navigationController: self.navigationController!)
//
//        timerViewCoordinator.start()
//
//        self.timerViewCoordinator = timerViewCoordinator
//    }
