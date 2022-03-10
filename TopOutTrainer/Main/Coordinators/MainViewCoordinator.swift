//
//  MainViewCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/9/21.
//

import Foundation
import UIKit


class MainViewCoordinator: NavigationCoordinator
{
    var childCoordinators: [Coordinator] = []
    var navigator: NavigatorType
    var rootViewController: UINavigationController
    
    private let mainViewController: MainViewController
    
    init()
    {
        let mainViewController = MainViewController()
        self.mainViewController = mainViewController
        
        let navigationController = UINavigationController(rootViewController: mainViewController)
        self.navigator = Navigator(navigationController: navigationController)
        self.rootViewController = navigationController
    }

    func start()
    {
        mainViewController.delegate = self
    }
    
    // Do not implement a stop function currently. Later it could be helpful to save data before closing the application.
        
}

extension MainViewCoordinator: MainViewControllerDelegate {
    func mainButtonPressed(event: Event) {
        print("Event: Main View's timer button has been pressed. Display the stopwatch to the user.")
        
        if event == .timer
        {
            let timerViewCoordinator = TimerViewCoordinator()
            self.pushCoordinator(timerViewCoordinator, animated: true)
            childCoordinators.append(timerViewCoordinator)
        }else
        if event == .calendar
        {
            let calendarViewCoordinator = CalendarViewCoordinator()
            self.pushCoordinator(calendarViewCoordinator, animated: true)
            childCoordinators.append(calendarViewCoordinator)
        }else
        if event == .stats
        {
            let statsViewCoordinator = StatsViewCoordinator()
            self.pushCoordinator(statsViewCoordinator, animated: true)
            childCoordinators.append(statsViewCoordinator)
        }
        else
        if event == .weights
        {
            let weightsViewCoordinator = WeightsViewCoordinator()
            self.pushCoordinator(weightsViewCoordinator, animated: true)
            childCoordinators.append(weightsViewCoordinator)
        }
    }
}
