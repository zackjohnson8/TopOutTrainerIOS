//
//  CaldendarViewCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/12/21.
//

import UIKit

final class CalendarViewCoordinator: PresentationCoordinator
{
    typealias ViewController = CalendarViewController
    
    var childCoordinators: [Coordinator] = []
    var rootViewController: CalendarViewController

    init()
    {
        rootViewController = CalendarViewController()
    }
    
    func start() {
        rootViewController.delegate = self
    }
    
    
}

extension CalendarViewCoordinator: CalendarViewControllerDelegate
{
    func backPressed() {
        #warning("implement maybe?")
    }
}
