//
//  AppCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

//import Foundation
//import UIKit
//
//final class AppCoordinator: Coordinator
//{
//    private(set) var childCoordinators: [Coordinator] = []
//    
//    private var window:UIWindow
//    
//    private var navigationController: UINavigationController?
//    private var timerViewCoordinator: TimerViewCoordinator?
//    
//    init (window: UIWindow)
//    {
//        self.window = window
//    }
//    
//    func start() {
//        let navigationController = UINavigationController()
//        let selectionViewCoordinator = SelectionViewCoordinator(navigationController: navigationController)
//
//        childCoordinators.append(selectionViewCoordinator as Coordinator)
//
//        selectionViewCoordinator.start()
//        
//        window.rootViewController = navigationController
//        window.makeKeyAndVisible()
//        
//        self.navigationController = navigationController
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
//}
