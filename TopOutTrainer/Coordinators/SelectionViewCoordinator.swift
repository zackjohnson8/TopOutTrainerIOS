//
//  SelectionViewCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit


class SelectionViewCoordinator: Coordinator
{
    var children: [Coordinator] = []
    var router: Router
    var rootViewController: SelectionViewController
    
    public init(router: Router) {
        self.router = router
        self.rootViewController = SelectionViewController() // Initial implementation of SelectionViewController
    }

    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        rootViewController.delegate = self
        router.present(rootViewController, animated: animated, onDismissed: onDismissed) // Passes the AppDelegateRouter the rootViewController (SelectionViewController).
    }
        
}

extension SelectionViewCoordinator: SelectionViewControllerDelegate
{
    func timerButtonPressed() {
        print("HelloQ!!!!")
    }
}

//extension SelectionViewCoordinator: SelectionViewControllerDelegate {
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
