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
    public var children: [Coordinator] = []
    public let router: Router
    
    //private lazy var selectionViewController = SelectionViewController.instantiate("Main") as SelectionViewController
    
    public init(router: Router) {
        self.router = router
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = SelectionViewController.init(delegate: self)
        router.present(viewController, animated: animated, onDismissed: onDismissed)
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
