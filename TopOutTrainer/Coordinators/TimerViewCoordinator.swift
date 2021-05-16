//
//  TimerViewCoordinator.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 5/10/21.
//

import UIKit

final class TimerViewCoordinator: PresentationCoordinator
{
    typealias ViewController = TimerViewController
    
    var childCoordinators: [Coordinator] = []
    var rootViewController: TimerViewController

    init()
    {
        rootViewController = TimerViewController()
    }
    
    func start() {
        rootViewController.delegate = self
    }
    
    
}

extension TimerViewCoordinator: TimerViewControllerDelegate
{
    func backPressed() {
        #warning("implement maybe?")
    }
}
